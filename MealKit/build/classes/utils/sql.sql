/* Form3에서 입력받은 값으로, Supplier 삽입 */
INSERT INTO SUPPLIER (sup_name, phone_num, sup_address, sup_email, sup_sell)
VALUES ('업체명', '010-0000-0001', '경기도 수원시 장안구 xx로, 업체빌딩 3층', 'hello@naver.com', '비닐팩,김치찌개카톤');

/* prod_id 조회 => product_nm 김치찌개, product_spec 2인 */
SELECT fp.PRODUCT_ID FROM FINISHED_PRODUCT fp 
WHERE fp.PRODUCT_NM = '김치찌개'
	AND fp.PRODUCT_SPEC='2인';

/* 만약 위의 조회결과가 있을 경우, 동일한 제품을 등록한다는 form을 입력하면 실제 insert는 작동하지 않도록 한다. */
/* 만약 위의 조회결과가 없을 경우, 실제로 insert를 한다. */
INSERT INTO FINISHED_PRODUCT(PRODUCT_NM, PRODUCT_DIV, PRODUCT_SPEC, PRODUCT_PRICE) 
	VALUES ('갈비탕', '국/탕/찌개', '2인', '9800');

-- Form2에서 입력한 내용
/* 만약, Form2에서 입력한 내용(감자)가 있으면, material 테이블에 insert 하지 않음.
 * 만약, 입력한 내용(감자)가 없으면, material 테이블에 insert 진행함.  */
SELECT m.MATERIAL_ID FROM MATERIAL m WHERE m.MATERIAL_NM = '감자';

-- 재료명, 재료 구분은 material 테이블에 INSERT
-- 재료 수량, 재료 단위는 BOM 테이블에 INSERT
INSERT INTO MATERIAL(MATERIAL_NM, MATERIAL_CLASSIFICATION)
	VALUES ('당면', '재료');


INSERT INTO BOM (MATERIAL_ID, BOM_PROD_QUANTITY, QUANTITY_UNITS)
SELECT m.MATERIAL_NM, 0.5, 'kg'
FROM MATERIAL m
WHERE m.MATERIAL_NM = '김치';


/*INSERT INTO BOM (MATERIAL_ID, BOM_PROD_QUANTITY, QUANTITY_UNITS, PRODUCT_ID)
SELECT 
    m.material_id,
    0.3,
    'kg',
    (SELECT fp.product_id FROM FINISHED_PRODUCT fp WHERE fp.product_nm = '김치찌개')
FROM MATERIAL m
WHERE m.MATERIAL_NM = '당면';*/


-- Form2에서 입력한 내용
/* prod_id 조회 => product_nm 갈비탕, product_spec 2인 */
SELECT fp.PRODUCT_ID FROM FINISHED_PRODUCT fp 
WHERE fp.PRODUCT_NM = '갈비탕'
	AND fp.PRODUCT_SPEC='2인';

/* 제품명, 제품스펙과 동일한 product_id가 있는 bom_id를 조회 */
-- 만약 이 쿼리문으로 bom_id가 조회되면, 같은 숫자를 bom_id에 insert, 조회에 사용한 product_id를 insert한다.
-- else 시퀀스로 bom_id에 insert, 조회에 사용한 product_id를 insert한다.
SELECT b.BOM_ID FROM BOM b 
WHERE b.PRODUCT_ID =
	(
	 SELECT fp.product_id
	 FROM FINISHED_PRODUCT fp
	 WHERE fp.PRODUCT_NM = '갈비탕'
		AND fp.PRODUCT_SPEC='2인'
	);

/* lot_size가 1000(입력값)이고, product_id가 같은, 생산일은 가장 최근이고, 수행일은 없는, 그 중에 lot_id가 제일 높은 lot_id를 조회 */
/* 만약, product_id가 같은 것이 있어서 조회가 된다면, 이것을 bom의 lot_id에 insert,
 * 
 * else, product_id가 없어서 조회가 안 된다면, 새로운 lot_id와 해당하는 product_id와 
 * '1000'의 lot_size를 insctuction 테이블에 insert 후, bom 테이블에 해당하는 lot_id를 insert */
SELECT MAX(i.lot_id) AS LOT_ID
FROM INSTRUCTION i 
WHERE i.product_id IN (
    SELECT fp2.product_id FROM FINISHED_PRODUCT fp2 WHERE fp2.product_nm = '갈비탕' AND fp2.product_spec = '2인'
)
AND i.LOT_SIZE = '1000'
AND i.MANU_DATE IS NULL
AND i.INST_DATE = (
    SELECT MAX(i2.INST_DATE)
    FROM INSTRUCTION i2
    WHERE i.PRODUCT_ID = i2.product_id
);


-- BOM_ID 값 수정할 것. -----------------------------------------
INSERT INTO BOM 
	(BOM_ID
	, PRODUCT_ID
	, MATERIAL_ID
	, BOM_PROD_QUANTITY
	, QUANTITY_UNITS
	)
VALUES (
	----------------------------------------------------
	-- bom_id 수정할 것.
	/* 제품명, 제품스펙과 동일한 product_id가 있는 bom_id를 조회 */
	-- 만약 이 쿼리문으로 bom_id가 조회되면, 같은 숫자를 bom_id에 insert, 조회에 사용한 product_id를 insert한다.
	-- else 시퀀스로 bom_id에 insert, 조회에 사용한 product_id를 insert한다.
	SELECT b.BOM_ID FROM BOM b 
	WHERE b.PRODUCT_ID =
		(
		 SELECT fp.product_id
		 FROM FINISHED_PRODUCT fp
		 WHERE fp.PRODUCT_NM = '갈비탕'
			AND fp.PRODUCT_SPEC='2인'
		)
	----------------------------------------------------
	-- product_id(Form1에서 입력된 값, '갈비탕'과 '2인')
	/* 만약 조회된 product_id가 있으면 그것을 insert 
	 * else 조회된 product_id가 없으면 새로운 product_id를 insert*/
	, (SELECT fp.product_id FROM FINISHED_PRODUCT fp WHERE fp.product_nm = '갈비탕' AND fp.product_spec = '2인')
	-- material_id(Form2에서 입력된 값, '갈비탕카톤')
	, (SELECT m.MATERIAL_ID FROM MATERIAL m WHERE m.MATERIAL_NM = '갈비탕카톤')
	-- l.product_id가 b.product_id와 같은 lot_id
	, (SELECT MAX(i.lot_id) AS LOT_ID
		FROM INSTRUCTION i 
		WHERE i.product_id IN (
		    SELECT fp2.product_id FROM FINISHED_PRODUCT fp2 WHERE fp2.product_nm = '갈비탕' AND fp2.product_spec = '2인'
		)
		AND i.LOT_SIZE = '1000'
		AND i.MANU_DATE IS NULL
		AND i.INST_DATE = (
		    SELECT MAX(i2.INST_DATE)
		    FROM INSTRUCTION i2
		    WHERE i.PRODUCT_ID = i2.product_id
		))
	-- bom_prod_quantity(Form2에서 입력된 값)
	, 1 * (b.lot_id = i.lot_id인 상황에서의 lot_size를 곱한다.)
	-- quantity_units(Form2에서 입력된 값)
	, 'ea'
	
)
;



