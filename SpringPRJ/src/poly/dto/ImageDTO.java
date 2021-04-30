package poly.dto;

public class ImageDTO {
	
	private String image_no;
	private String save_file_name;
	private String save_file_path;
	private String org_file_name;
	private String user_id;
	private String reg_id;
	private String chg_id;
	private String like;
	private String circle_cnt;
	private String ext; 
	
	public String getSave_file_name() {
		return save_file_name;
	}
	public void setSave_file_name(String save_file_name) {
		this.save_file_name = save_file_name;
	}
	public String getSave_file_path() {
		return save_file_path;
	}
	public void setSave_file_path(String save_file_path) {
		this.save_file_path = save_file_path;
	}
	public String getOrg_file_name() {
		return org_file_name;
	}
	public void setOrg_file_name(String org_file_name) {
		this.org_file_name = org_file_name;
	}
	
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	
	public String getImage_no() {
		return image_no;
	}
	public void setImage_no(String image_no) {
		this.image_no = image_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getChg_id() {
		return chg_id;
	}
	public void setChg_id(String chg_id) {
		this.chg_id = chg_id;
	}
	public String getLike() {
		return like;
	}
	public void setLike(String like) {
		this.like = like;
	}
	public String getCircle_cnt() {
		return circle_cnt;
	}
	public void setCircle_cnt(String circle_cnt) {
		this.circle_cnt = circle_cnt;
	}


}
