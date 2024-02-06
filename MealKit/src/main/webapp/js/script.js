function login() {
    // 로그인 로직을 여기에 추가
    // 백엔드와의 통신 등
    alert('로그인 성공');
}

// 필요한 기능에 따라 추가적인 JavaScript 코드 작성

//공지사항 
function searchText_jo() {
    		location.href = "./adminNoticeList.jsp?search=" + $('#search_text_jo').val();
    	}
function noticeDelete(noticeNum) {
 	if (confirm('정말 삭제하시겠습니까?')) {
        location.href = "./adminNoticeDelete.jsp?num=" + noticeNum;
    	}
    }