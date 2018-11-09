package main;

import ohtu.ohtuvarasto.Varasto;


public class Main {

    public static void main(String[] args) {

        Varasto mehua = new Varasto(1);
        System.out.println(mehua.getTilavuus());
        System.out.println(mehua.getSaldo());
    }
}
