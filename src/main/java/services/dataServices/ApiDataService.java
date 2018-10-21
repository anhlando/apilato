package services.dataServices;

import java.util.Map;

public class ApiDataService implements IDataService {

    @Override
    public String getOTP() throws Throwable {
        return null;
    }

    @Override
    public String getOTP(String contractNo) throws Throwable {
        return null;
    }

    @Override
    public String getContractByStatusAndType(String status, String contractType) throws Throwable {
        return null;
    }

    @Override
    public String getCuidByContractNo(String contractNo) throws Throwable {
        return null;
    }

    @Override
    public String getPrimaryPhoneByContractNo(String contract) throws Throwable{
        return null;
    }

    @Override
    public boolean isAccountExisted(String phone) throws Throwable {
        return false;
    }
}
