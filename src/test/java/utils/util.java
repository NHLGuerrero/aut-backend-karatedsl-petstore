package utils;

public class util {

    private String generate_random(String available_characters, int result_length) {
		String result = "";
		int charactersLength = available_characters.length();
		for (int i = 0; i < result_length; i++) {
			result += available_characters.charAt((int) Math.floor(Math.random() * charactersLength));
		}
		return result;
	}
    
    public String random_string(int length) {
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		return generate_random(characters, length);
	}
	    
	public String random_number(int length) {
		String characters = "123456789";
		return generate_random(characters, length);
	}
}
