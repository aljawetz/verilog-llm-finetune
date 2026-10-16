`timescale 1ns/1ps

module tb_Con_In;

    parameter fix_bit = 7;
    parameter bits = 16;
    
    reg [7:0] in00, in01, in02, in03, in04, in05, in06, in07;
    reg [7:0] in08, in09, in010, in011, in012, in013, in014, in015;
    reg [7:0] in016, in017, in018, in019, in020, in021, in022, in023;
    reg [7:0] in024, in025, in026, in027, in028, in029, in030, in031;
    
    wire [(2*bits)-1:0] out0, out1, out2, out3, out4, out5, out6, out7;
    wire [(2*bits)-1:0] out8, out9, out10, out11, out12, out13, out14, out15;
    wire [(2*bits)-1:0] out16, out17, out18, out19, out20, out21, out22, out23;
    wire [(2*bits)-1:0] out24, out25, out26, out27, out28, out29, out30, out31;

    Con_In #(fix_bit, bits) uut (
        .in00(in00), .in01(in01), .in02(in02), .in03(in03),
        .in04(in04), .in05(in05), .in06(in06), .in07(in07),
        .in08(in08), .in09(in09), .in010(in010), .in011(in011),
        .in012(in012), .in013(in013), .in014(in014), .in015(in015),
        .in016(in016), .in017(in017), .in018(in018), .in019(in019),
        .in020(in020), .in021(in021), .in022(in022), .in023(in023),
        .in024(in024), .in025(in025), .in026(in026), .in027(in027),
        .in028(in028), .in029(in029), .in030(in030), .in031(in031),
        .out0(out0), .out1(out1), .out2(out2), .out3(out3),
        .out4(out4), .out5(out5), .out6(out6), .out7(out7),
        .out8(out8), .out9(out9), .out10(out10), .out11(out11),
        .out12(out12), .out13(out13), .out14(out14), .out15(out15),
        .out16(out16), .out17(out17), .out18(out18), .out19(out19),
        .out20(out20), .out21(out21), .out22(out22), .out23(out23),
        .out24(out24), .out25(out25), .out26(out26), .out27(out27),
        .out28(out28), .out29(out29), .out30(out30), .out31(out31)
    );

    initial begin
        // Initialize inputs
        in00 = 8'd1; in01 = 8'd2; in02 = 8'd3; in03 = 8'd4;
        in04 = 8'd5; in05 = 8'd6; in06 = 8'd7; in07 = 8'd8;
        in08 = 8'd9; in09 = 8'd10; in010 = 8'd11; in011 = 8'd12;
        in012 = 8'd13; in013 = 8'd14; in014 = 8'd15; in015 = 8'd16;
        in016 = 8'd17; in017 = 8'd18; in018 = 8'd19; in019 = 8'd20;
        in020 = 8'd21; in021 = 8'd22; in022 = 8'd23; in023 = 8'd24;
        in024 = 8'd25; in025 = 8'd26; in026 = 8'd27; in027 = 8'd28;
        in028 = 8'd29; in029 = 8'd30; in030 = 8'd31; in031 = 8'd32;

        // Wait for a while to stabilize
        #10;

        // Check outputs
        if (out0 !== {8'b00000000, 8'd1, 7'b0000000}) begin
            $display("FAIL: Output out0 mismatch");
            $finish;
        end
        if (out1 !== {8'b00000000, 8'd2, 7'b0000000}) begin
            $display("FAIL: Output out1 mismatch");
            $finish;
        end
        if (out2 !== {8'b00000000, 8'd3, 7'b0000000}) begin
            $display("FAIL: Output out2 mismatch");
            $finish;
        end
        if (out3 !== {8'b00000000, 8'd4, 7'b0000000}) begin
            $display("FAIL: Output out3 mismatch");
            $finish;
        end
        if (out4 !== {8'b00000000, 8'd5, 7'b0000000}) begin
            $display("FAIL: Output out4 mismatch");
            $finish;
        end
        if (out5 !== {8'b00000000, 8'd6, 7'b0000000}) begin
            $display("FAIL: Output out5 mismatch");
            $finish;
        end
        if (out6 !== {8'b00000000, 8'd7, 7'b0000000}) begin
            $display("FAIL: Output out6 mismatch");
            $finish;
        end
        if (out7 !== {8'b00000000, 8'd8, 7'b0000000}) begin
            $display("FAIL: Output out7 mismatch");
            $finish;
        end
        if (out8 !== {8'b00000000, 8'd9, 7'b0000000}) begin
            $display("FAIL: Output out8 mismatch");
            $finish;
        end
        if (out9 !== {8'b00000000, 8'd10, 7'b0000000}) begin
            $display("FAIL: Output out9 mismatch");
            $finish;
        end
        if (out10 !== {8'b00000000, 8'd11, 7'b0000000}) begin
            $display("FAIL: Output out10 mismatch");
            $finish;
        end
        if (out11 !== {8'b00000000, 8'd12, 7'b0000000}) begin
            $display("FAIL: Output out11 mismatch");
            $finish;
        end
        if (out12 !== {8'b00000000, 8'd13, 7'b0000000}) begin
            $display("FAIL: Output out12 mismatch");
            $finish;
        end
        if (out13 !== {8'b00000000, 8'd14, 7'b0000000}) begin
            $display("FAIL: Output out13 mismatch");
            $finish;
        end
        if (out14 !== {8'b00000000, 8'd15, 7'b0000000}) begin
            $display("FAIL: Output out14 mismatch");
            $finish;
        end
        if (out15 !== {8'b00000000, 8'd16, 7'b0000000}) begin
            $display("FAIL: Output out15 mismatch");
            $finish;
        end
        if (out16 !== {8'b00000000, 8'd17, 7'b0000000}) begin
            $display("FAIL: Output out16 mismatch");
            $finish;
        end
        if (out17 !== {8'b00000000, 8'd18, 7'b0000000}) begin
            $display("FAIL: Output out17 mismatch");
            $finish;
        end
        if (out18 !== {8'b00000000, 8'd19, 7'b0000000}) begin
            $display("FAIL: Output out18 mismatch");
            $finish;
        end
        if (out19 !== {8'b00000000, 8'd20, 7'b0000000}) begin
            $display("FAIL: Output out19 mismatch");
            $finish;
        end
        if (out20 !== {8'b00000000, 8'd21, 7'b0000000}) begin
            $display("FAIL: Output out20 mismatch");
            $finish;
        end
        if (out21 !== {8'b00000000, 8'd22, 7'b0000000}) begin
            $display("FAIL: Output out21 mismatch");
            $finish;
        end
        if (out22 !== {8'b00000000, 8'd23, 7'b0000000}) begin
            $display("FAIL: Output out22 mismatch");
            $finish;
        end
        if (out23 !== {8'b00000000, 8'd24, 7'b0000000}) begin
            $display("FAIL: Output out23 mismatch");
            $finish;
        end
        if (out24 !== {8'b00000000, 8'd25, 7'b0000000}) begin
            $display("FAIL: Output out24 mismatch");
            $finish;
        end
        if (out25 !== {8'b00000000, 8'd26, 7'b0000000}) begin
            $display("FAIL: Output out25 mismatch");
            $finish;
        end
        if (out26 !== {8'b00000000, 8'd27, 7'b0000000}) begin
            $display("FAIL: Output out26 mismatch");
            $finish;
        end
        if (out27 !== {8'b00000000, 8'd28, 7'b0000000}) begin
            $display("FAIL: Output out27 mismatch");
            $finish;
        end
        if (out28 !== {8'b00000000, 8'd29, 7'b0000000}) begin
            $display("FAIL: Output out28 mismatch");
            $finish;
        end
        if (out29 !== {8'b00000000, 8'd30, 7'b0000000}) begin
            $display("FAIL: Output out29 mismatch");
            $finish;
        end
        if (out30 !== {8'b00000000, 8'd31, 7'b0000000}) begin
            $display("FAIL: Output out30 mismatch");
            $finish;
        end
        if (out31 !== {8'b00000000, 8'd32, 7'b0000000}) begin
            $display("FAIL: Output out31 mismatch");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule