public class ParseOutput{
    public static void main(String[] args){
        String s = String.join("", args);
        if(s.indexOf("FAILURE")<0){
            System.exit(100);
        }
        
        else{
            System.exit((2-Integer.parseInt(args[args.length-1])) * 50 );
        }
    }
}