<html>

<head>
    <title>TechCon - Register</title>
    <link rel="stylesheet" href="resources/css/techcon-styles.css">
    <script src="resources/js/techcon-registration.js"></script>
    <!-- <script src="/home/karthikd/Workspace/Academics/Semester_6/IP_Lab/Ex3_Form+JS/scripts/registration.js"></script> -->
</head>

<body onload="startClock();">

    <iframe src="resources/templates/techcon-header.html" id="Main__headerFrame" scrolling="no"></iframe>

    <div id="Main__navbar">
        <ul class="Main__navlist">
            | <li class="Main__navitem"><a class="Main__navlink" href="register">About</a></li>
            | <li class="Main__navitem"><a href="register?form=render" class="Main__navlink">Register</a></li>
            |<li class="Main__navitem"><a href="/E5-Sessions/login?action=logout" class="Main__navlink">Logout</a></li>
            |
        </ul>
    </div>

    <div id="Main__clockWrapper">
        <p><span id="Main__clock">Clock</span></p>
    </div>

    <div id="TechConRegister__content" style="font-size: 16px; margin: 10px">
        <form class="TechConRegister__form" id="TechConRegister__form" method="POST" action="/E5-Sessions/register">

            <div class="TechConRegister__fieldWrapper">
                <label class="TechConRegister__label" for="fname_in">Full Name</label>
                <div class="TechConRegister__inputWrapper">
                    <input type="text" id="fname_in" name="fullname" placeholder="Your full name..."
                        class="TechConRegister__textIn" onblur="validateFullName(event);" oninvalid="alertFormError();"
                        required>
                    <p class="TechConRegister__fieldError" id="TechConRegister__nameError"></p>
                </div>
            </div>

            <div class="TechConRegister__fieldWrapper">
                <label class="TechConRegister__label" for="colgname_in">College Name</label>
                <div class="TechConRegister__inputWrapper">
                    <input type="text" id="colgname_in" name="colgname" placeholder="Your college is..."
                        class="TechConRegister__textIn" onblur="validateCollegeName(event);"
                        oninvalid="alertFormError();" required>
                    <p class="TechConRegister__fieldError" id="TechConRegister__colgnameError"></p>
                </div>
            </div>

            <div class="TechConRegister__fieldWrapper">
                <label class="TechConRegister__label" for="colgaddr_in">College Address</label>
                <div class="TechConRegister__inputWrapper">
                    <textarea id="colgaddr_in" name="colgaddr" placeholder="Your college is at..."
                        class="TechConRegister__textIn" onblur="validateCollegeAddress(event);"
                        oninvalid="alertFormError();"></textarea>
                    <p class="TechConRegister__fieldError" id="TechConRegister__colgaddrError"></p>
                </div>
            </div>

            <div class="TechConRegister__fieldWrapper">
                <label class="TechConRegister__label" for="colgPin_in">PIN</label>
                <div class="TechConRegister__inputWrapper">
                    <input type="text" id="colgPin_in" name="colgPin" placeholder="PIN Code is..."
                        class="TechConRegister__textIn" onblur="validateAddressPIN(event);"
                        oninvalid="alertFormError();" required>
                    <p class="TechConRegister__fieldError" id="TechConRegister__colgPinError"></p>
                </div>
            </div>

            <div class="TechConRegister__fieldWrapper">
                <label class="TechConRegister__label" for="age_in">Age</label>
                <div class="TechConRegister__inputWrapper">
                    <input type="text" id="age_in" name="age" placeholder="Age is..." class="TechConRegister__textIn"
                        onblur="validateAge(event);" oninvalid="alertFormError();">
                    <p class="TechConRegister__fieldError" id="TechConRegister__ageError"></p>
                </div>
            </div>

            <div class="TechConRegister__fieldWrapper">
                <label class="TechConRegister__label" for="dob_in">Date of Birth</label>
                <div class="TechConRegister__inputWrapper">
                    <input type="date" id="age_in" name="dob" placeholder="Date of Birth is..."
                        class="TechConRegister__textIn" onblur="validateDob(event);" oninvalid="alertFormError();"
                        onfocus="setMaxDateForMinAge(event, 6);">
                    <p class="TechConRegister__fieldError" id="TechConRegister__dobError">
                    </p>
                </div>
            </div>

            <div class="TechConRegister__fieldWrapper">
                <label class="TechConRegister__label" for="gender_in">Gender</label>
                <div class="TechConRegister__inputWrapper">
                    <div id="gender_in" name="dob" class="TechConRegister__radioIn">
                        <input type="radio" name="gender" value="Male" required>
                        <label for="male">Male</label><br>
                        <input type="radio" name="gender" value="Female" required>
                        <label for="female">Female</label><br>
                        <input type="radio" name="gender" value="Other" required>
                        <label for="other">Other</label><br>
                    </div>
                    <p class="TechConRegister__fieldError" id="TechConRegister__dobError">
                    </p>
                </div>
            </div>

            <div class="TechConRegister__fieldWrapper">
                <label class="TechConRegister__label" for="dept_in">Department</label>
                <div class="TechConRegister__inputWrapper">
                    <select id="status" name="department" class="TechConRegister__selectIn"
                        onchange="validateDept(event);" oninvalid="alertFormError();" required>
                        <option value="none" selected="selected">Select Department...</option>
                        <option value="CSE">CSE</option>
                        <option value="IT">IT</option>
                        <option value="ECE">ECE</option>
                        <option value="Mechanical">Mechanical</option>
                    </select><br /><br />
                    <p class="TechConRegister__fieldError" id="TechConRegister__deptError">
                    </p>
                </div>
            </div>

            <div class="TechConRegister__fieldWrapper">
                <label class="TechConRegister__label" for="contact_in">Contact Number</label>
                <div class="TechConRegister__inputWrapper">
                    <input type="text" id="contact_in" name="contact" placeholder="Contact is..."
                        class="TechConRegister__textIn" onblur="validateContact(event);" oninvalid="alertFormError();"
                        required>
                    <p class="TechConRegister__fieldError" id="TechConRegister__contactError"></p>
                </div>
            </div>

            <div class="TechConRegister__fieldWrapper">
                <label class="TechConRegister__label" for="age_in">Email ID</label>
                <div class="TechConRegister__inputWrapper">
                    <input type="email" id="email_in" name="email" placeholder="Email ID is..."
                        class="TechConRegister__textIn" onblur="validateEmail(event);" oninvalid="alertFormError();"
                        required readonly value="${useremail}">
                    <p class="TechConRegister__fieldError" id="TechConRegister__emailError"></p>
                </div>
            </div>

            <div class="TechConRegister__fieldWrapper">
                <label class="TechConRegister__label" for="TechConRegister__skillSelected">Programming Skills</label>
                <input id="TechConRegister__skillIn" type="text" name="skills" value="" hidden>
                <div class="TechConRegister__inputWrapper" id="TechConRegister__skillsInWrapper">
                    <div id="TechConRegister__skillWrapper">
                        <div id="TechConRegister__skillSelected" ondragover="allowDrop(event);"
                            ondragenter="allowDrop(event);" ondrop="addDraggedElement(event);">
                            <p class="TechConRegister__skillsTitle">Your Skills</p>
                            <option id="TechConRegister__javaLabel" class="TechConRegister__skillLabel" value="Java"
                                draggable="true" ondragstart="storeDragElement(event);">Java</option>
                            <option id="TechConRegister__rubyLabel" class="TechConRegister__skillLabel" value="Ruby"
                                draggable="true" ondragstart="storeDragElement(event);">Ruby</option>
                        </div>
                        <div id="TechConRegister__skillAvailable" ondragover="allowDrop(event);"
                            ondragenter="allowDrop(event);" ondrop="addDraggedElement(event);">
                            <p class="TechConRegister__skillsTitle">Choose from here</p>

                            <option id="TechConRegister__cppLabel" class="TechConRegister__skillLabel" value="C++"
                                draggable="true" ondragstart="storeDragElement(event);">C++</option>
                            <option id="TechConRegister__pythonLabel" class="TechConRegister__skillLabel" value="Python"
                                draggable="true" ondragstart="storeDragElement(event);">Python</option>
                        </div>
                    </div>
                    <p class="TechConRegister__fieldError" id="TechConRegister__skillLabelError"></p>
                </div>
            </div>

            <div class="TechConRegister__fieldWrapper">
                <label class="TechConRegister__label" for="hobbies_in">Hobbies</label>
                <div class="TechConRegister__inputWrapper">
                    <div id="TechConRegister__hobbiesIn" class="TechConRegister__checkboxIn">
                        <div>
                            <input type="checkbox" name="hobby-1" value="Cycling">
                            <label for="Cycling">Cycling</label><br>
                        </div>
                        <div>
                            <input type="checkbox" name="hobby-2" value="Reading">
                            <label for="Reading">Reading</label><br>
                        </div>
                        <div>
                            <input type="checkbox" name="hobby-3" value="Singing">
                            <label for="Singing">Singing</label><br>
                        </div>
                        <div>
                            <input type="checkbox" name="hobby-4" value="Dancing">
                            <label for="Dancing">Dancing</label><br>
                        </div>
                    </div>
                    <p class="TechConRegister__fieldError" id="TechConRegister__dobError">
                    </p>
                </div>
                <input type="hidden" id="TechConRegister__hobbiesInHidden" name="hobbies" value="" />
            </div>

            <div class="TechConRegister__fieldWrapper">
                <label class="TechConRegister__label" for="letter_in">Consent Letter</label>
                <div class="TechConRegister__inputWrapper">
                    <input type="file" id="letter_in" name="letter" placeholder="Consent letter"
                        class="TechConRegister__fileIn" onblur="validateFile(event);" oninvalid="alertFormError();">
                    <p class="TechConRegister__fieldError" id="TechConRegister__letterError"></p>
                </div>
            </div>

        </form>

        <div class="TechConRegister__fieldWrapper" id="TechConRegister__buttonWrapper">
            <button form="TechConRegister__form" id="TechConRegister__submit"
                onclick="appendSkillIn();appendHobbyIn();">Submit</button>
            <button id="TechConRegister__reset" onclick="resetForm('TechConRegister__form');">Reset</button>
        </div>

        <input type="hidden" name="user_email" value="${useremail}" />

        `
    </div>
</body>

</html>