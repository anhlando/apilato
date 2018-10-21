package dao;

import org.springframework.jdbc.core.JdbcTemplate;
import utilities.Environment;

public class BslDaoImpl implements IBslDao {

    private JdbcTemplate jdbcTemplate;

    public BslDaoImpl(){
        this.jdbcTemplate = Environment.dataSources.getBslJdbcTemplate();
    }

    @Override
    public String queryContracByStatusAndType(String status, String contractType) throws Throwable {
        String query = "select CONTRACT_CODE\n" +
                "        from HO.BSL_CONTRACT sample(10) \n" +
                "        where STATUS = '" + status +"'\n" +
                "        and CONTRACT_TYPE = '" + contractType + "'\n" +
                "        and rownum <= 1" ;
        try {
            return CommonDao.selectSingleResultAsString(this.jdbcTemplate,query);
        }
        catch (Throwable e){
            throw e;
        }
    }

    @Override
    public String queryPrimaryPhoneByCUID(String cuid) throws Throwable {
        String query = "select p.phone_number \n" +
                "        from PIF.PIF_PARTY_ROLE c join PIF.PIF_CONTACT p on c.id = p.Party_role_id \n" +
                "        where c.EXTERNAL_ID = '" + cuid + "'\n" +
                "        and p.CLASSIFICATION = 'PRIMARY_MOBILE'\n" +
                "        and p.ACTIVE_YN = 1";
        try {
            return CommonDao.selectSingleResultAsString(this.jdbcTemplate,query);
        }
        catch (Throwable e){
            if (e.getMessage().startsWith("No result found for query: select ")){
                return "";
            }
            else throw e;
        }
    }

    @Override
    public String queryCuidFromContractNo(String contractNo) throws Throwable {
        String query = "select cl.cuid from ho.bsl_contract c\n" +
                "        join HO.BSL_CLIENT_SNAPSHOT s on c.CLIENT_SNAPSHOT_ID = s.ID\n" +
                "        join HO.BSL_CLIENT cl on s.CLIENT_ID = cl.ID\n" +
                "        where c.CONTRACT_CODE = '" + contractNo + "'";
        try {
            return CommonDao.selectSingleResultAsString(this.jdbcTemplate,query);
        }
        catch (Throwable e){
           throw e;
        }
    }

}
