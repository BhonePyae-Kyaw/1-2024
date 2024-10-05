// Online Java Compiler
// Use this editor to write, compile and run your Java code online

class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Try programiz.pro");
    }
}

public class consCell {
    private int head;
    private int tail;
    
    public consCell(int h, consCell t) {
        head = h;
        tail = t;
    }
    
    public int getHead() {
        return head;
    }
    public consCell getTail() {
        return tail;
    }
    
    public void setTail(consCell t) {
        tail = t;
    }
}

public class IntList {
    private consCell start;

    public IntList (consCell s) {
        start = s;
    }

    public IntList cons (int h) {
        return new IntList(new consCell(h, start))
    }
}