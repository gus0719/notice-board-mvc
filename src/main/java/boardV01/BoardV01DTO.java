package boardV01;

public class BoardV01DTO {
	private int bod_no; // 글 번호
	private String bod_writer; // 작성자
	private String bod_email; // 작성자 이메일주소
	private String bod_subject; // 글 제목
	private String bod_pwd; // 작성자 비밀번호
	private String bod_logtime; // 작성된 날짜
	private String bod_content; // 작성내용
	private int bod_readCnt; // 조회수
	private String bod_connIp; // 작성자 ip주소
	
	public BoardV01DTO() {};
	
	public BoardV01DTO(String bod_writer, String bod_email, String bod_subject, String bod_pwd, String bod_content,
			String bod_connIp) { // To. Write
		this.bod_writer = bod_writer;
		this.bod_email = bod_email;
		this.bod_subject = bod_subject;
		this.bod_pwd = bod_pwd;
		this.bod_content = bod_content;
		this.bod_connIp = bod_connIp;
	}
	
	public BoardV01DTO(int bod_no, String bod_writer, String bod_email, String bod_subject, String bod_pwd,
			String bod_content) { // To. Update
		this.bod_no = bod_no;
		this.bod_writer = bod_writer;
		this.bod_email = bod_email;
		this.bod_subject = bod_subject;
		this.bod_pwd = bod_pwd;
		this.bod_content = bod_content;
	}

	public BoardV01DTO(int bod_no, String bod_writer, String bod_email, String bod_subject, String bod_logtime,
			String bod_content, int bod_readCnt) { // To. Content
		this.bod_no = bod_no;
		this.bod_writer = bod_writer;
		this.bod_email = bod_email;
		this.bod_subject = bod_subject;
		this.bod_logtime = bod_logtime;
		this.bod_content = bod_content;
		this.bod_readCnt = bod_readCnt;
	}

	public BoardV01DTO(int bod_no, String bod_writer, String bod_subject, String bod_logtime, int bod_readCnt,
			String bod_connIp) { // To. TitleListFrame
		this.bod_no = bod_no;
		this.bod_writer = bod_writer;
		this.bod_subject = bod_subject;
		this.bod_logtime = bod_logtime;
		this.bod_readCnt = bod_readCnt;
		this.bod_connIp = bod_connIp;
	}

	public BoardV01DTO(int bod_no, String bod_writer, String bod_email, String bod_subject, String bod_pwd,
			String bod_logtime, String bod_content, int bod_readCnt, String bod_connIp) {
		this.bod_no = bod_no;
		this.bod_writer = bod_writer;
		this.bod_email = bod_email;
		this.bod_subject = bod_subject;
		this.bod_pwd = bod_pwd;
		this.bod_logtime = bod_logtime;
		this.bod_content = bod_content;
		this.bod_readCnt = bod_readCnt;
		this.bod_connIp = bod_connIp;
	}
	
	// ============================= BOD_NO <1>
	public int getBod_no() {
		return bod_no;
	}
	public void setBod_no(int bod_no) {
		this.bod_no = bod_no;
	}
	
	// ============================= BOD_WRITER <2>
	public String getBod_writer() {
		return bod_writer;
	}
	public void setBod_writer(String bod_writer) {
		this.bod_writer = bod_writer;
	}
	
	// ============================= BOD_EMAIL <3>
	public String getBod_email() {
		return bod_email;
	}
	public void setBod_email(String bod_email) {
		this.bod_email = bod_email;
	}
	
	// ============================= BOD_SUBJECT <4>
	public String getBod_subject() {
		return bod_subject;
	}
	public void setBod_subject(String bod_subject) {
		this.bod_subject = bod_subject;
	}
	
	// ============================= BOD_PWD <5>
	public String getBod_pwd() {
		return bod_pwd;
	}
	public void setBod_pwd(String bod_pwd) {
		this.bod_pwd = bod_pwd;
	}
	
	// ============================= BOD_LOGTIME <6>
	public String getBod_logtime() {
		return bod_logtime;
	}
	public void setBod_logtime(String bod_logtime) {
		this.bod_logtime = bod_logtime;
	}
	
	// ============================= BOD_CONTENT <7>
	public String getBod_content() {
		return bod_content;
	}
	public void setBod_content(String bod_content) {
		this.bod_content = bod_content;
	}
	
	// ============================= BOD_READCNT <8>
	public int getBod_readCnt() {
		return bod_readCnt;
	}
	public void setBod_readCnt(int bod_readCnt) {
		this.bod_readCnt = bod_readCnt;
	}
	
	// ============================= BOD_CONNIP <9>
	public String getBod_connIp() {
		return bod_connIp;
	}
	public void setBod_connIp(String bod_connIp) {
		this.bod_connIp = bod_connIp;
	}
}