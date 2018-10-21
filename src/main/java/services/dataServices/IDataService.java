package services.dataServices;

import java.util.Map;

public interface IDataService {
    public String getOTP() throws Throwable;
    public String getOTP(String contractNo) throws Throwable;

    public String getContractByStatusAndType(String status, String contractType) throws Throwable;
    public String getCuidByContractNo(String contractNo) throws Throwable;
    public String getPrimaryPhoneByContractNo(String contract) throws Throwable;

    public boolean isAccountExisted(String phone) throws Throwable;
}
