package dao;


import java.util.Map;

public interface IBslDao {
    public String queryContracByStatusAndType(String status, String contractType) throws Throwable;
    public String queryPrimaryPhoneByCUID(String contractNo) throws Throwable;
    public String queryCuidFromContractNo(String contractNo) throws Throwable;

}
