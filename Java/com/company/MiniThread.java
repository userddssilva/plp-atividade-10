package com.company;
import java.lang.*;

class MiniThread extends Thread {
    int n;
    MiniThread(int m) { n=m; }
    public void run() {
        do { Thread.yield(); n--; } while (n>0);
    }
}
