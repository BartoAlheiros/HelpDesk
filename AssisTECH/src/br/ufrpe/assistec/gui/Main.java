package br.ufrpe.assistec.gui;
	
import java.sql.Connection;

import br.ufrpe.assistec.factory.ConexaoMySQL;
import javafx.application.Application;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.layout.BorderPane;
import javafx.fxml.FXMLLoader;


public class Main extends Application {
	@Override
	public void start(Stage primaryStage) {
		try {
			BorderPane root = (BorderPane)FXMLLoader.load(getClass().getResource("Login.fxml"));
			Scene scene = new Scene(root,360,450);
			scene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
			primaryStage.setScene(scene);
			primaryStage.setTitle("AssisTECH - Login");
			primaryStage.setHeight(450);
			primaryStage.setWidth(360);
			primaryStage.setResizable(false);
			primaryStage.show();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
            //iniciando a conexão ao banco
            ConexaoMySQL.getConexaoMySQL();

            //exibe status após conexao
            System.out.println(ConexaoMySQL.statusConection());
            
            launch(args);
            
            ConexaoMySQL.FecharConexao();
          }
}
