# Atividade 10

> Dayvson Silva - ddss.snf19@uea.edu.br<br/>
Jonatas<br/>
Jackson<br/>
Lucas<br/>

## O programa Morte Por Concorrência

É chamado:

death --threads N --vezes M


Ele cria N threads. Cada thread não faz nada além de ceder imediatamente sua vez ( função yield() ). Normalmente deixaríamos o escalonador preemptivo cuidar de interromper um thread para alternar para um novo, mas aqui, a fim de exercer o pior caso, assim que um thread pode ser executado, ele cede explicitamente. Portanto, o programa faz pouco mais do que alternar entre os threads. Cada thread cede sua vez M vezes e depois termina. Quando todos os threads terminarem, o programa também termina.

```java
import java.lang.*;
class MiniThread extends Thread {
    int n;
    MiniThread(int m) { n=m; }
    public void run() {
        do { yield(); n--; } while (n>0);
    }
}
public class Death {
    public static void main(String[] argv) {
        int threads = Integer.parseInt(argv[0]);
        int times   = Integer.parseInt(argv[1]);
        for(int i=threads;i>0;i--) {
            MiniThread t = new MiniThread(i);
            t.start();
        }
    }
}
```

**1)** Crie uma versão Python usando a classe Thread 


**2)** Crie uma versão em Erlang ( utilize a seção que cria uma lista de processos da atividade 009 ) 


**3)** Rode  os 3 (java, python e erlang ) programas com:
100 processos e 100 mensagens
1000 processos e 1000 mensagens
10000 processos e 1000 mensagens
100000 processos e 10000 mensagens


**Anote e apresente os tempos**


> Entregável:<br/>
- Programas no github e rodando na hora da aula
- Apresentação
