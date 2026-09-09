package vn.iotstar.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "`User`")
@Getter
@Setter
@NoArgsConstructor
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "email", nullable = false, length = 255)
    private String email;

    @Column(name = "username", nullable = false, length = 100)
    private String userName;

    @Column(name = "fullname", length = 255)
    private String fullName;

    @Column(name = "password", nullable = false, length = 255)
    private String passWord;

    @Column(name = "avatar", length = 255)
    private String avatar;

    @Column(name = "roleid", nullable = false)
    private int roleid;

    @Column(name = "phone", length = 20)
    private String phone;

    @Temporal(TemporalType.DATE)
    @Column(name = "createddate")
    private Date createdDate;

    @Column(name = "active", nullable = false)
    private boolean active;

    @Column(name = "otp_code", length = 10)
    private String otpCode;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "otp_expire")
    private Date otpExpire;

    public User(String email, String userName, String fullName, String passWord,
                String avatar, int roleid, String phone, Date createdDate) {
        this.email = email;
        this.userName = userName;
        this.fullName = fullName;
        this.passWord = passWord;
        this.avatar = avatar;
        this.roleid = roleid;
        this.phone = phone;
        this.createdDate = createdDate;
    }
}
