function valid_check() {
    const frm = document.forms[0]
    const namef = frm.name
    const telf = frm.tel
    const addrf = frm.addr
    const gradef = frm.grade.value
    const grades = ['A','B','C']
    const cityf = frm.city_code.value;      //도시코드값 - 조건:숫자로만 2자리
    const temp = parseInt(cityf);   
    //*cityf 에 시작문자가 숫자가 아니면 정수변환이 안되고 결과값이 NaN 가 됩니다.*
    //console.log(cityf +':'+ temp)   //테스트용입니다.
    //console.log(`테스트 : ${cityf.split('')} (${typeof cityf})}`)
    let isValid=true;
    if(namef.value == ""){
      alert('이름을 입력해주세요')
      namef.focus()
      isValid=false
    }
    else if(telf.value == ""){
      alert('전화번호를 입력해주세요')
      telf.focus()
      isValid=false
    }
	else if(telf.value.length > 13){
      alert('전화번호는 최대 13자 입니다.')
      telf.focus()
      isValid=false
    }
    else if(addrf.value == ""){
      alert('주소를 입력해주세요')
      addrf.focus()
      isValid=false
    }else 
    if (grades.indexOf(gradef)==-1){
        //console.log(grades.indexOf(gradef))
        alert('A,B,C 중 하나만 입력해주십시오');    
        isValid= false;
    } else 
    if(cityf.length!=2) {
        alert('도시코드는 2자리 숫자입니다.')
        isValid=false
    }else{      //코드의 자릿수가 커서 검사할 요소가 많을 때 
        let cnt=0;
        cityf.split('').forEach(function(value){
            //cityf 문자열 데이터를 배열로 변환하고 각 요소값으로 이 함수를 실행합니다.
            //이 때 문자는 처리 조건에 따라 '0'~'9' 사이어야합니다.
            if(!(value>='0' && value <='9')){
                isValid=false;
                cnt++;
            }
        })
        if(cnt>0)
            alert('도시코드는 숫자만 입력하세요.')
    }    
    if(isValid){
        alert('유효성 검사 통과!')  //완성되면 주석처리
    }else
        alert('유효성 검사 실패')   //완성되면 주석처리

    return isValid;
}