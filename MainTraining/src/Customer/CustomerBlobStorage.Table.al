table 60152 "Customer Blob Storage Table"
{
    fields
    {
        field(1;PKEY; Integer)
        {
            
        }
        field(2;BLOB; BLOB){
            Subtype = Bitmap;

        }
    }
    
    keys
    {
        key(PK; PKEY)
        {
            Clustered = true;
        }
    }
}