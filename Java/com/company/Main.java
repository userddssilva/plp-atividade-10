package com.company;
import java.util.Scanner;

public class Main {
    public static void main(String[] argv) {

        Scanner scan = new Scanner(System.in);
        System.out.println("Threads:");
        int threads = Integer.parseInt(scan.nextLine());
        System.out.println("Times:");
        int times   = Integer.parseInt(scan.nextLine());

        long start = System.currentTimeMillis();
        for(int i=threads;i>0;i--) {
            MiniThread t = new MiniThread(i);
            t.start();
        }

        long end = System.currentTimeMillis();

        System.out.println(end - start + "ms");

    }
}
