package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    //declaraçao das variaveis para manipulaçao dos objetos e dados

    int peso ;
    float altura ;
    float imc;
    String mensagem = "";

    //declaraçao dos objetos (layout)
    EditText editpeso , editaltura;
    TextView txtresultado;
    Button btcalcular;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //apontando os objetos do layout
        editpeso = (EditText) findViewById(R.id.peso);
        editaltura = (EditText) findViewById(R.id.altura);
        txtresultado = (TextView)  findViewById(R.id.resultado);
        btcalcular = (Button) findViewById(R.id.btcalcular) ;

        btcalcular.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                // recuperar os valores digitados

                peso = Integer.parseInt(editpeso.getText().toString());
                altura = Float.parseFloat(editaltura.getText().toString());

                //Calcular o IMC

                   imc = peso / (altura * altura );

                   //Verificar as faixas de peso (usando a estrutura de decisao if )
                    if (imc <18.5) {
                        mensagem = "Abaixo do peso";

                    }else if ((imc >=18.5) && (imc < 25)) {
                        mensagem = "Peso ideal";
                    }else if ((imc >=25.0) && (imc < 30.0)){
                        mensagem = "Levemente acima do peso";
                    }else if ((imc >=30.0) && (imc < 35.0)){
                        mensagem = "Obesidade Grau I";
                    }else if ((imc >=35.0) && (imc < 40.0)){
                        mensagem = "Obesidade Grau II (Severa)";
                    }else   {
                        mensagem = "Obesidade Grau III (Morbida)";

                    }

                    //mostrar o resultado para o usuario
                txtresultado.setText(
                        "IMC:" +
                        String.valueOf(imc) +
                                "\nmensagem: " +mensagem
                );






            }
        });
    }
}
