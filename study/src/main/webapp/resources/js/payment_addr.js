// 주소 API 호출
	function execPostCode() {
		new daum.Postcode({
			oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분
			
			// 도로명 주소의 노출 규칙에 따라 주소를 조합
			// 내려오는 변수가 값이 없는 경우에 공백값을 가지기 때문에 분기함
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 도로명 조합형 조합 변수
			
			// 법정동명이 있을 경우 추가
			// 법정동의 경우 마지막 문자가 '동/로/가'로 끝남
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            console.log(data.zonecode);
            console.log(fullRoadAddr);            
            
            $("[name=orderAddr1]").val(data.zonecode);
            $("[name=orderAddr2]").val(fullRoadAddr);        
            
         	// 우편번호와 주소 정보를 해당 필드에 넣는다.
			// 5자리 새우편번호 사용
            document.getElementById('orderAddr1').value = data.zonecode; 
            document.getElementById('orderAddr2').value = fullRoadAddr;
        }
		}).open();
	}