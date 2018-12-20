public class meuComparador implements java.util.Comparator<Face>{
    @Override
    public int compare(Face f1,Face f2){
    
        return f1.get_z_medio() - f2.get_z_medio();
    }
}
