package dto;

public class BomListVo {
	private int list_seq;
	private int bom_id;
	private int product_id;
	private String product_nm;
	private String product_div;
	private String product_spec;
	private int product_price;
	private int lot_id;
	private int lot_size;
	private String material_classification;
	private int material_id;
	private String material_nm;
	private String quantity_units;
	private int bom_prod_quantity;
	

	public int getList_seq() {
		return list_seq;
	}
	public void setList_seq(int list_seq) {
		this.list_seq = list_seq;
	}
	public int getBom_id() {
		return bom_id;
	}
	public void setBom_id(int bom_id) {
		this.bom_id = bom_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_nm() {
		return product_nm;
	}
	public void setProduct_nm(String product_nm) {
		this.product_nm = product_nm;
	}
	public String getProduct_div() {
		return product_div;
	}
	public void setProduct_div(String product_div) {
		this.product_div = product_div;
	}
	public String getProduct_spec() {
		return product_spec;
	}
	public void setProduct_spec(String product_spec) {
		this.product_spec = product_spec;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getLot_id() {
		return lot_id;
	}
	public void setLot_id(int lot_id) {
		this.lot_id = lot_id;
	}
	public int getLot_size() {
		return lot_size;
	}
	public void setLot_size(int lot_size) {
		this.lot_size = lot_size;
	}
	public String getMaterial_classification() {
		return material_classification;
	}
	public void setMaterial_classification(String material_classification) {
		this.material_classification = material_classification;
	}
	public int getMaterial_id() {
		return material_id;
	}
	public void setMaterial_id(int material_id) {
		this.material_id = material_id;
	}
	public String getMaterial_nm() {
		return material_nm;
	}
	public void setMaterial_nm(String material_nm) {
		this.material_nm = material_nm;
	}
	public String getQuantity_units() {
		return quantity_units;
	}
	public void setQuantity_units(String quantity_units) {
		this.quantity_units = quantity_units;
	}
	public int getBom_prod_quantity() {
		return bom_prod_quantity;
	}
	public void setBom_prod_quantity(int bom_prod_quantity) {
		this.bom_prod_quantity = bom_prod_quantity;
	}


	@Override
	public String toString() {
		return "seq: " + this.list_seq +", bom_id: " + this.bom_id + ", prod_id: " + this.product_id + ", product_nm: " + this.product_nm +
				this.product_div + this.product_spec +
				this.lot_size + this.material_classification +
				this.material_id + this.material_nm + this.quantity_units +
				this.bom_prod_quantity
				/* + "bom_prod_quantity: " + this.bom_prod_quantity + ", "
				+ "material_id: " + this.material_id + " "*/
			;
	}
	
}
