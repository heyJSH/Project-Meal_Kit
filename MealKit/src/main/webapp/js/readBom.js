/* 버튼을 누르면 제품명, 제품구분, 재료명을 
java의 readBomList(String searchProdNm, String searchProdDiv, String searchMatNm)함수에 전달 */
function submitReadBomForm() {
	document.getElementById('searchBom').submit();
}


/* 수정 버튼을 누르면, 해당하는 줄의 내용을 수정 */
function editRow(rowId) {
  var tableRow = document.getElementById('table').querySelector('tbody tr[data-row-id="' + rowId + '"]');
  var tableData = tableRow ? tableRow.children : null;

  if (tableData) {
    // 기존의 수정 버튼 숨기기
    var updateButton = tableRow.querySelector('.btn-update');
    if (updateButton) {
      updateButton.style.display = 'none';
    }

    // 수정을 위한 동적 Form 양식 만들기
    var dynamicForm = document.createElement('form');
    dynamicForm.setAttribute('action', '#');
    dynamicForm.setAttribute('method', 'get');
    dynamicForm.setAttribute('id', 'modifyForm_' + rowId);
    dynamicForm.style.display = 'flex';
    dynamicForm.style.alignItems = 'center';

    // 각 행의 cell마다 input field 또는 텍스트 생성
    for (var i = 2; i < tableData.length - 1; i++) {
      /*var inputContainer = document.createElement('div');*/
      var inputContainer = document.createElement('th');
			
			if (i === 5) {
				// 수정 가능한 데이터 => input 필드 생성
        var input = document.createElement('input');
        input.setAttribute('type', 'text');
        input.setAttribute('name', 'editData_' + i);
        input.setAttribute('value', tableData[i].innerText);
        input.style.width = '82px';  // 입력 칸의 너비 조정
        inputContainer.appendChild(input);
			} else if (i === 6 || i === 7 || i === 8 || i === 9 || i === 10 || i === 11 || i === 12) {
        // 수정 가능한 데이터 => input 필드 생성
        var input = document.createElement('input');
        input.setAttribute('type', 'text');
        input.setAttribute('name', 'editData_' + i);
        input.setAttribute('value', tableData[i].innerText);
        input.style.width = '60px';  // 입력 칸의 너비 조정
        inputContainer.appendChild(input);
      } else {
        // 텍스트로 표시되는 경우 span 요소 생성
        var textSpan = document.createElement('span');
        textSpan.innerText = tableData[i].innerText;
        inputContainer.appendChild(textSpan);
      }

      // 각 cell의 너비 조정
      if(i === 2) {
				// 동적 Form의 첫 번째 cell의 시작 위치
				inputContainer.style.marginLeft = '10%';
			} else {
				inputContainer.style.marginLeft = '2.5%';  // 간격 조정
			}

      dynamicForm.appendChild(inputContainer);
    }

    // Confirm 및 Cancel 버튼 생성
    var confirmBtn = document.createElement('button');
    confirmBtn.setAttribute('type', 'button');
    confirmBtn.setAttribute('class', 'btn btn-success btn-sm');
    confirmBtn.setAttribute('onclick', 'submitUpdate(' + rowId + ')');
    confirmBtn.innerText = 'Confirm';

    var cancelBtn = document.createElement('button');
    cancelBtn.setAttribute('type', 'button');
    cancelBtn.setAttribute('class', 'btn btn-danger btn-sm');
    cancelBtn.setAttribute('onclick', 'cancelUpdate(' + rowId + ')');
    cancelBtn.innerText = 'Cancel';

    // 수정 Form이 들어갈 빈 행 추가
    var modifyRow = document.createElement('tr');
    modifyRow.setAttribute('id', 'modifyRow_' + rowId);
    var modifyCell = document.createElement('td');
    modifyCell.setAttribute('colspan', tableData.length);
    modifyCell.appendChild(dynamicForm);
    modifyRow.appendChild(modifyCell);

    // 동적 Form을 row 다음에 추가
    tableRow.parentNode.insertBefore(modifyRow, tableRow.nextSibling);

    // Confirm 및 Cancel 버튼 추가
    var buttonsRow = document.createElement('tr');
    buttonsRow.setAttribute('id', 'buttonsRow_' + rowId);
    var buttonsCell = document.createElement('td');
    buttonsCell.setAttribute('colspan', tableData.length);
    buttonsCell.style.textAlign = 'right';  // 오른쪽 정렬

    buttonsCell.appendChild(confirmBtn);
    buttonsCell.appendChild(cancelBtn);

    buttonsRow.appendChild(buttonsCell);

    // 동적 Form 다음에 버튼 행 추가
    tableRow.parentNode.insertBefore(buttonsRow, modifyRow.nextSibling);
  } else {
    console.error('행을 찾을 수 없습니다. rowId:', rowId);
  }
}

/* Confirm 버튼 => 업데이트된 Data를 submit 처리 */
function submitUpdate(rowId) {
  var formId = 'modifyForm_' + rowId;
  var dynamicForm = document.getElementById(formId);

  // 수정 Form이 들어간 빈 행과 버튼 행을 찾아서 삭제
  var modifyRow = document.getElementById('modifyRow_' + rowId);
  var buttonsRow = document.getElementById('buttonsRow_' + rowId);

  if (modifyRow) {
    modifyRow.parentNode.removeChild(modifyRow);
  }

  if (buttonsRow) {
    buttonsRow.parentNode.removeChild(buttonsRow);
  }

  // 기존의 수정 버튼 다시 표시
  var updateButton = document.querySelector('tbody tr[data-row-id="' + rowId + '"] .btn-update');
  if (updateButton) {
    updateButton.style.display = 'inline-block';
  }

  // Submit 전에 Form 요소 제거
  dynamicForm.parentNode.removeChild(dynamicForm);

  // Submit 처리
  dynamicForm.submit();
}


/* Cancel 버튼 */
function cancelUpdate(rowId) {
  // 수정 Form이 들어간 빈 행과 버튼 행을 찾아서 삭제
  var modifyRow = document.getElementById('modifyRow_' + rowId);
  var buttonsRow = document.getElementById('buttonsRow_' + rowId);

  if (modifyRow) {
    modifyRow.parentNode.removeChild(modifyRow);
  }

  if (buttonsRow) {
    buttonsRow.parentNode.removeChild(buttonsRow);
  }

  // 기존의 수정 버튼 다시 표시
  var updateButton = document.querySelector('tbody tr[data-row-id="' + rowId + '"] .btn-update');
  if (updateButton) {
    updateButton.style.display = 'inline-block';
  }
}





