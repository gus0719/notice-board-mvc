package common;

public class UserAPI{
	public void mLine(char mark, int length){
		for(int repeat = 0; repeat < length; repeat++){
			System.out.print(mark);
		}
		System.out.println();
	}
	public String mLineReturn(char mark, int length){
		String line = "";
		for(int repeat = 0; repeat < length; repeat++){
			line += mark;
		}
		return line;
	}
}