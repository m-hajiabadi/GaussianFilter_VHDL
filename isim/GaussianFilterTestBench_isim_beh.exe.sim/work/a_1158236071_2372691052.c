/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/Uni/term7/FPGA/Project/FPGA_FINAL_PROJECT/GaussianFilterTestBench.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;
extern char *STD_TEXTIO;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1158236071_2372691052_p_0(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(72, ng0);

LAB3:    t1 = (5 * 1000LL);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t4);
    t2 = (t0 + 3312);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t10 = (t0 + 3312);
    xsi_driver_intertial_reject(t10, t1, t1);

LAB2:    t11 = (t0 + 3216);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1158236071_2372691052_p_1(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3232);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(80, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 5608U);
    t5 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t4, t3);
    t6 = (t0 + 1488U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    *((int *)t6) = t5;
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 2704);
    t3 = (t0 + 1992U);
    t4 = (t0 + 1488U);
    t6 = *((char **)t4);
    t5 = *((int *)t6);
    std_textio_write5(STD_TEXTIO, t1, t3, t5, (unsigned char)0, 0);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 2704);
    t3 = (t0 + 1816U);
    t4 = (t0 + 1992U);
    std_textio_writeline(STD_TEXTIO, t1, t3, t4);
    goto LAB3;

}


extern void work_a_1158236071_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1158236071_2372691052_p_0,(void *)work_a_1158236071_2372691052_p_1};
	xsi_register_didat("work_a_1158236071_2372691052", "isim/GaussianFilterTestBench_isim_beh.exe.sim/work/a_1158236071_2372691052.didat");
	xsi_register_executes(pe);
}
