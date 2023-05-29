package com.g10.JolieWeb.DTO;

import java.util.Date;

import com.g10.JolieWeb.Entity.Cart;
import com.g10.JolieWeb.Entity.Config;

public class BillinfoDTO {

	private Integer id;
    private Cart cart;
    private Config configByPaymentMethod;
	private Config configByShippingMethod;
    private float totalPrice;
    private String shippingAddress;
    private String recipientName;
    private String recipientPhone;
    private Date datePayment;
    private Config configByStatus;

    public BillinfoDTO() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Config getConfigByPaymentMethod() {
		return configByPaymentMethod;
	}

	public void setConfigByPaymentMethod(Config configByPaymentMethod) {
		this.configByPaymentMethod = configByPaymentMethod;
	}

	public Config getConfigByShippingMethod() {
		return configByShippingMethod;
	}

	public void setConfigByShippingMethod(Config configByShippingMethod) {
		this.configByShippingMethod = configByShippingMethod;
	}

	public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getRecipientPhone() {
        return recipientPhone;
    }

    public void setRecipientPhone(String recipientPhone) {
        this.recipientPhone = recipientPhone;
    }

    public Date getDatePayment() {
        return datePayment;
    }

    public void setDatePayment(Date datePayment) {
        this.datePayment = datePayment;
    }
    public Config getConfigByStatus() {
		return configByStatus;
	}

	public void setConfigByStatus(Config configByStatus) {
		this.configByStatus = configByStatus;
	}

}

