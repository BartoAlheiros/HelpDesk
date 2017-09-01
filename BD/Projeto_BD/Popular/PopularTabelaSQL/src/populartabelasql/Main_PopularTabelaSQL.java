/**
 * @author Bart� Alheiros
 * Olinda, 15 de julho de 2017.
 * Programa que lê de um arquivo .csv e devolve código para popular tabela SQL com os dados.
 * Utilzando a função SQL INSERT INTO TABLE
 */
package populartabelasql;

import java.io.*;

public class Main_PopularTabelaSQL{

	public static void main(String[] args) throws IOException {
            String linha;
            String table = "CONTRACHEQUE";
            String srcArchive = "Excel_BD.ods - CONTRACHEQUE (1).csv";
            String dstArchive = table + ".sql";
            String pathSrc = "C:\\Users\\Bartô\\Downloads\\" + srcArchive;
            String pathDst = "C:\\Users\\Bartô\\Desktop\\" + dstArchive;
            
            FileReader reader = new FileReader(pathSrc);
            BufferedReader bfReader = new BufferedReader(reader);
            FileWriter writer = new FileWriter(pathDst);
            BufferedWriter bfWriter = new BufferedWriter(writer);
            
            while((linha = bfReader.readLine()) != null) {
                bfWriter.write("INSERT INTO " + table + " "); bfWriter.write("VALUES("+linha+");");
                bfWriter.newLine(); //pula duas linhas
                bfWriter.newLine(); 
            }    

            bfReader.close(); /* Tinha esquecido dessa linha */
            bfWriter.close();
            reader.close();
            writer.close();
}

}