package SkillTest.Controller;

import SkillTest.Model.*;
import SkillTest.Interface.*;
import SkillTest.Exception.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.io.*;

public class SkillsQuiz extends HttpServlet{
    private String BaseViewsPath = "/WEB-INF/views/techcon";

    private String getViewPath(String relPath){
        return BaseViewsPath + "/" + relPath;
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        /* Read email-id from Cookie */
        try{
            String email = "karthi@g.c";
            
            QuizBank quiz_handle = new QuizBank();
            Quizlet quiz_questions = quiz_handle.getRandomQuestionsForUser(email);

            /* Construct HTML for Questions */
            String quiz_html = "";
            for(int i=0;i<quiz_questions.getQuestions().size();i++){
                quiz_html += "<div class='TechConRegister__QfieldWrapper'><label class='TechConRegister__Qlabel'>";
                quiz_html += String.format(
                    "Q%d: %s",
                    i+1,
                    quiz_questions.getQuestions().get(i)
                );
                quiz_html += "<br /></label><div class='TechConRegister__inputWrapper'><div class='TechConRegister__radioIn'>"; 
                    
                quiz_html += String.format(
                    "<input type='radio' name='%s' value='a' required> <label>%s</label><br />",
                    quiz_questions.getQuestionIds().get(i),
                    quiz_questions.getOptionAs().get(i)
                );
                quiz_html += String.format(
                    "<input type='radio' name='%s' value='b' required> <label>%s</label><br />",
                    quiz_questions.getQuestionIds().get(i),
                    quiz_questions.getOptionBs().get(i)
                );
                quiz_html += String.format(
                    "<input type='radio' name='%s' value='c' required> <label>%s</label><br />",
                    quiz_questions.getQuestionIds().get(i),
                    quiz_questions.getOptionCs().get(i)
                );
                quiz_html += "</div></div></div>";
            }

            request.setAttribute("quizpalette", quiz_html);
            RequestDispatcher view = request.getRequestDispatcher(getViewPath("quiz.jsp"));
            view.forward(request, response);
        }
        catch(NoSkillsFoundException e){
            System.out.println(e);
        }
        catch(Exception e){
            System.out.println(e);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response){
        
        try{
            Enumeration quiz_fields = request.getParameterNames();
            ArrayList<String> q_ids = new ArrayList<String>();
            HashMap<String,String> q_responses = new HashMap<String,String>();
            String question_id;
            while(quiz_fields.hasMoreElements()){
                question_id = quiz_fields.nextElement().toString();
                q_ids.add(question_id);
                q_responses.put(question_id, request.getParameter(question_id));
            }
            System.out.println(q_ids);
            System.out.println(q_responses);
            
            /* Retreive the verification palette */
            QuizBank quiz_handle = new QuizBank();
            Quizlet verify_palette = quiz_handle.getVerificationPaletteForQuestions(q_ids);

            /* Verify answers and score */
            ArrayList<String> skills = new ArrayList<String>();
            ArrayList<Integer> scores = new ArrayList<Integer>();
            ArrayList<Integer> totals = new ArrayList<Integer>();
            String curr_skill;
            String prev_skill = "";
            int score_set_idx = -1;
            int scored_total = 0;
            int possible_total = 0;
            for(int i=0;i<verify_palette.getSkills().size();i++){
                curr_skill = verify_palette.getSkills().get(i).toString();
                if(!curr_skill.equals(prev_skill)){
                    prev_skill = curr_skill;
                    score_set_idx += 1;
                    scores.add(0);
                    totals.add(0);
                    skills.add(curr_skill);
                }
                if(verify_palette.getCorrectOptions().get(i).equals(
                    q_responses.get(verify_palette.getQuestionIds().get(i))
                )){
                    // Correct response
                    scores.set(score_set_idx, scores.get(score_set_idx)+10);
                    scored_total += 10;
                }
                possible_total += 10;
                totals.set(score_set_idx, totals.get(score_set_idx)+1);
            }

            /* Make HTML for result table */
            String result_html = "";
            for(int i=0;i<skills.size();i++){
                result_html += "<tr><td class='Qualif__tableCell'>";
                result_html += skills.get(i);
                result_html += "</td><td>";
                result_html += scores.get(i);
                result_html += "</td><td>";
                result_html += String.format("%d", totals.get(i)*10);
                result_html += "</td></tr>";
            }

            /* Render results */
            request.setAttribute("resultrows", result_html);
            request.setAttribute("resulttotal", scored_total);
            request.setAttribute("possibletotal", possible_total);
            RequestDispatcher view = request.getRequestDispatcher(getViewPath("quiz-scores.jsp"));
            view.forward(request, response);
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
}