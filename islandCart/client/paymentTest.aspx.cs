using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stripe;
using Stripe.Checkout;

namespace islandCart.client
{
    public partial class paymentTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StripeConfiguration.ApiKey = "sk_test_51PF9O0DZISg8Z4OB0EYFBaj8QSnnrxbqlhJAKUUtpOy1aihQWAv3ek07ngkAM1P0IIbidgcwP2fIVOaikBuxM1ZS00hj3Qca5E";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Get the amount from the textbox
            int amount;
             //string baseUrl = "https://" + HttpContext.Current.Request.Url.Authority;

            if (!int.TryParse(txtAmount.Text, out amount))
            {
                // Handle invalid input
                return;
            }

            try
            {
                // Create Checkout Session
                var options = new SessionCreateOptions
                {
                    PaymentMethodTypes = new List<string> { "card" },
                    LineItems = new List<SessionLineItemOptions>
            {
                new SessionLineItemOptions
                {
                    PriceData = new SessionLineItemPriceDataOptions
                    {
                        UnitAmount = amount * 100, // Stripe uses cents, so multiply by 100
                        Currency = "usd",
                        ProductData = new SessionLineItemPriceDataProductDataOptions
                        {
                            Name = "Your Product Name",
                        },
                    },
                    Quantity = 1,
                },
            },
                    Mode = "payment",
                    SuccessUrl ="https://yourwebsite.com",
                    CancelUrl = "https://yourwebsite.com",
                };
                var service = new SessionService();
                var session = service.Create(options);

                // Redirect to Stripe Checkout page for payment
                Response.Redirect(session.Url);
            }
            catch (StripeException ex)
            {
                // Handle Stripe API errors
                // Log the error or display a message to the user
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}