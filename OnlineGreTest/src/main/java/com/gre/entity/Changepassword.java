package com.gre.entity;

import org.springframework.stereotype.Component;

@Component

public class Changepassword {

private String oldPassword;

private String newPassword;

private String conformPassword;

public String getOldPassword() {

return oldPassword;

}

public void setOldPassword(String oldPassword) {

this.oldPassword = oldPassword;

}

public String getNewPassword() {

return newPassword;

}

public void setNewPassword(String newPassword) {

this.newPassword = newPassword;

}

public String getConformPassword() {

return conformPassword;

}

public void setConformPassword(String conformPassword) {

this.conformPassword = conformPassword;

}

}