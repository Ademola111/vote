class Config(object):
    DATABASE_URI="some random parameters "
    MERCHANT_ID="NACOS"

class ProductionConfig(Config):
    SQLALCHEMY_DATABASE_URI="mysql+mysqlconnector://root@127.0.0.1/voting"   
    SQLALCHEMY_TRACK_MODIFICATIONS=True
    
    MERCHANT_ID="NA2345@3lCOS#"

class Test_config(Config):
    DATABASE_URL="Test Connection parameters"