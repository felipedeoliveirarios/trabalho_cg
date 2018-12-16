public class meuComparador implements java.util.Comparator<Face>{
    @Override
    public int compare(Face f1,Face f2){
    
        return int(f1.get_z_medio()) - int(f2.get_z_medio());
    }
}
