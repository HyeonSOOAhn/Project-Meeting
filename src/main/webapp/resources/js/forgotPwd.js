const f = document.myForm, 
	password = f.querySelector("#InputPassword"),
    password_con = f.querySelector("#RepeatPassword"),
    passwordCon = f.querySelector(".passwordCon"),
    btn = f.querySelector(".resetBtn");
    
    
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
        $btn = $('.resetBtn').attr('disabled', true);
        passwordCon.classList.add("show");
    } else {
        passwordCon.classList.remove("show");
        ableBtn();
    }
}

function ableBtn() {
    if (password.value != null && password_con.value != null) {
        $btn = $('.resetBtn').attr('disabled', false);
    }else{
    	$btn = $('.resetBtn').attr('disabled', true);
    }
}
    
    
    
function init() {
    password.addEventListener("blur", confirmPassword);
    password_con.addEventListener("blur", confirmPassword);
}


init();