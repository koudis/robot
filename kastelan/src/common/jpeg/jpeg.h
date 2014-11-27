#define        PLANAR                    0x80
#define        FOUR_ZERO_ZERO            0
#define        FOUR_TWO_ZERO            1
#define        FOUR_TWO_TWO            2
#define        FOUR_FOUR_FOUR            3
#define        RGB                        4

#define        FOUR_TWO_ZERO_P        ( 1 | PLANAR )



unsigned char *encode_image (unsigned char *, unsigned char *, unsigned int, unsigned int, unsigned int, unsigned int);
//output_end = encode_image((unsigned char *)0x01800000, output_start, quality, FOUR_TWO_TWO, 320, 256); 
void initialize_quantization_tables(unsigned int);
extern unsigned char Lqt[], Cqt[];

