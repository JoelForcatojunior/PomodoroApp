import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TipoIntervalo { TRABALHO, DESCANSO}
abstract class _PomodoroStore  with Store{
  @observable
  bool iniciado = false; 

  @observable
  int minutos = 2;
  
  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDescanso = 1;  

  @observable
  TipoIntervalo tipointervalo = TipoIntervalo.TRABALHO;
  
  Timer? cronometro;

  @action
 void iniciar() {
    iniciado = true;
    cronometro = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (minutos == 0 && segundos == 0) {
        _trocarTipoIntervalo();
      } else if (segundos == 0) {
        segundos = 59;
        minutos--;
      } else {
        segundos--;
      }
    });
  }
  @action
  void parar(){
    iniciado = false;
    cronometro?.cancel();
  }

   
  @action
  void reiniciar() {
    parar();
    minutos = estaTrabalhando() ? tempoTrabalho : tempoDescanso;
    segundos = 0;
  }

  @action
  void incrementarTempoTrabalho(){
    tempoTrabalho++;
    if(estaTrabalhando()) {
      reiniciar();
    }
  }

  @action
  void decrementarTempoTrabalho(){
    if (tempoTrabalho >1 ){
    tempoTrabalho--;
        if(estaTrabalhando()) {
      reiniciar();
     }
    }
  }
    @action
  void incrementarTempoDescansop() {
    tempoDescanso++;
    if (estaDescansando()) {
      reiniciar();
    }
  }

    @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
    if (estaDescansando()) {
      reiniciar();
    }
  }

  @action
  void decrementarTempoDescansop() {
    if (tempoDescanso > 1) {
      tempoDescanso--;
      if (estaDescansando()) {
        reiniciar();
      }
    }
  }

  bool estaTrabalhando () {
    return tipointervalo == TipoIntervalo.TRABALHO;
}

  bool estaDescansando () {
    return tipointervalo == TipoIntervalo.DESCANSO;
}

  void _trocarTipoIntervalo(){
    if(estaTrabalhando()) {
      tipointervalo = TipoIntervalo.DESCANSO;
      minutos = tempoDescanso;
   } else {
      tipointervalo = TipoIntervalo.TRABALHO;
      minutos = tempoTrabalho;
   }

   segundos = 0;
  }
}