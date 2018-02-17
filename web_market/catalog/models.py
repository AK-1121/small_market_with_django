from django.db import models


# Create your models here.
class ProductType(models.Model):
    name = models.CharField(max_length=50, unique=True)
    # raiting = models.DecimalField(max_digits=7, decimal_places=4)
    raiting = models.FloatField()
    description = models.TextField(default='')


class SubProductType(models.Model):
    name = models.CharField(max_length=50, unique=True)
    # raiting = models.DecimalField(max_digits=7, decimal_places=4)
    raiting = models.FloatField()
    type_id = models.ForeignKey('ProductType', on_delete=models.CASCADE)
    description = models.TextField(default='')


class Product(models.Model):
    sub_type_id = models.IntegerField()
    name = models.CharField(max_length=200)
    manufacture = models.CharField(max_length=200)
    # raiting = models.DecimalField(max_digits=4, decimal_places=2)
    raiting = models.FloatField()
    # image_url = models.ImageField(upload_to='static/', height_field=300, width_field=400)
    image_url = models.URLField()
    parameters = models.CharField(max_length=3000)

    class Meta:
        unique_together = ('name', 'manufacture')


class Shop(models.Model):
    name = models.CharField(max_length=200)
    address = models.CharField(max_length=2000)
    raiting = models.DecimalField(max_digits=7, decimal_places=4)
    self_pickup = models.BooleanField(default=False)
    phones = models.CharField(max_length=200)
    delivery_conditions = models.CharField(max_length=200)
    url = models.URLField(default='')

    class Meta:
        unique_together = ('name', 'address')


class SaleVariant(models.Model):
    # product_id = models.ForeignKey('Product', on_delete=models.CASCADE)
    # shop_id = models.ForeignKey('Shop', on_delete=models.CASCADE)
    product = models.OneToOneField(Product, on_delete=models.CASCADE)
    shop = models.OneToOneField(Shop, on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=9, decimal_places=2)
    amount = models.IntegerField(default=0)
    special_parameters = models.CharField(max_length=3000, default='{}')
    url = models.URLField(default='')

    class Meta:
        unique_together = ('product', 'shop')


