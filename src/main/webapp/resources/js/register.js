
const f = document.myForm,
    name = f.querySelector("#userName"),
    nameCon = f.querySelector(".nameCon"),
    id = f.querySelector("#userId"),
    idCon = f.querySelector(".idCon"),
    email = f.querySelector("#InputEmail"),
    emailCon = f.querySelector(".emailCon"),
    tel = f.querySelector("#tel"),
    telCon = f.querySelector(".telCon"),
    password = f.querySelector("#InputPassword"),
    password_con = f.querySelector("#RepeatPassword"),
    passwordCon = f.querySelector(".passwordCon"),
    gender = f.querySelectorAll("input[name='gender']"),
    btn = document.getElementsByClassName("registerBtn");

var regex;

function confirmName() {
    if (name.value.length < 2) {
        nameCon.innerText = "이름은 외자여도 두 글자 아닌가요?";
        nameCon.classList.add("show");
        name.focus();
    } else {
        nameCon.classList.remove("show");
        ableBtn();
    }
}

function confirmId() {
    if (id.value.length < 8) {
        idCon.innerText = "아이디가 너무 짧아요! [8-15]자로 맞춰주세요!";
        idCon.classList.add("show");
        id.focus();
    } else if (id.value.length > 15) {
        idCon.innerText = "아이디가 너무 길어요! [8-15]자로 맞춰주세요!";
        idCon.classList.add("show");
        id.focus();

    } else {
        idCon.classList.remove("show");
        ableBtn();
    }

}

function confirmPassword(event) {
    if (password.value.length < 8) {
        passwordCon.innerText = "비밀번호가 너무 짧아요! [8-15]자로 맞춰주세요!";
        passwordCon.classList.add("show");
        password.focus();
    } else if (password.value.length > 15) {
        passwordCon.innerText = "비밀번호가 너무 길어요! [8-15]자로 맞춰주세요!";
        passwordCon.classList.add("show");
        password.focus();
    } else if (password.value !== password_con.value) {
        passwordCon.innerText = "비밀번호가 다릅니다.";
        passwordCon.classList.add("show");
    } else {
        passwordCon.classList.remove("show");
        ableBtn();
    }
}

function confirmTel() {
    regex = /^[0-9]*$/;

    if (!regex.test(tel.value)) {
        telCon.innerText = "['-','.']등 이 없이 숫자로만 입력해주세요.";
        telCon.classList.add("show");
        tel.focus();
    } else {
        telCon.classList.remove("show");
        ableBtn();
    }

}

function confirmEmail() {

    regex = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;

    if (!regex.test(email.value)) {
        emailCon.innerText = "이메일 형식에 맞게 입력해주세요.";
        emailCon.classList.add("show");
        email.focus();
    } else {
        emailCon.classList.remove("show");
        ableBtn();
    }
}

function ableBtn() {
    if (name.value != null && id.value != null && password.value != null && password_con.value != null && email.value != null && tel.value != null) {
        if (f.querySelector('input[name="gender"]').checked) {

            $btn = $('.registerBtn').attr('disabled', false);
        }
    }
}

function init() {

    name.addEventListener("blur", confirmName);
    id.addEventListener("blur", confirmId);
    password.addEventListener("blur", confirmPassword);
    password_con.addEventListener("blur", confirmPassword);
    email.addEventListener("blur", confirmEmail);
    tel.addEventListener("blur", confirmTel);
    for (var i = 0; i < gender.length; i++) {
        gender[i].addEventListener("click", ableBtn);
    }

}


init();
