package com.example.veterinaria;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class menu extends AppCompatActivity {

    CardView cardViewRegistrarMascota, cardViewBuscarC, cardViewListaM, cardViewNuevoUsuario;

    int idCliente;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu);
        loadUI();

        Intent intent = getIntent();
        idCliente = intent.getIntExtra("idcliente", 0);

        cardViewRegistrarMascota.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), registro_mascota.class);
                intent.putExtra("idcliente", idCliente);
                startActivity(intent);
            }
        });

        cardViewBuscarC.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), buscar_clientes.class);
                startActivity(intent);

            }
        });

        cardViewListaM.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), lista_mascotas.class);
                startActivity(intent);
            }
        });

        cardViewNuevoUsuario.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), registro_clientes.class);
                startActivity(intent);

            }
        });
    }


    private void  loadUI(){
        cardViewRegistrarMascota = findViewById(R.id.cardRegistrarMascota);
        cardViewBuscarC = findViewById(R.id.cardViewBuscarC);
        cardViewListaM = findViewById(R.id.cardViewListaM);
        cardViewNuevoUsuario = findViewById(R.id.cardViewNuevoUsuario);

    }
}