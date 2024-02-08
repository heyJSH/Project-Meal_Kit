/* select에서 제품명 선택하기 */
function ch_prodNM() {
	var select = document.getElementById("prod_nm");	// class = product_name인 데이터 선택
	var selectValue = select.options[select.selectedIndex].value;	// select element에서 선택된 option의 value가 저장됨
	console.log(selectValue);
}

/* select에서 제품규격 선택하기 */
function ch_prodDiv() {
	var select = document.getElementById("prod_div");	// class = prod_div인 데이터 선택
	var selectValue = select.options[select.selectedIndex].value;	// select element에서 선택된 option의 value가 저장됨
	console.log(selectValue);
}