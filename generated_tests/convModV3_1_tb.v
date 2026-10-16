`timescale 1ns/1ps

module tb_convModV3;

    reg signed [24:0] last_result;
    reg signed [7:0] data00, data01, data02, data03;
    reg signed [7:0] data10, data11, data12, data13;
    reg signed [7:0] data20, data21, data22, data23;
    reg signed [7:0] data30, data31, data32, data33;
    reg signed [7:0] kernel00, kernel01, kernel02, kernel03;
    reg signed [7:0] kernel10, kernel11, kernel12, kernel13;
    reg signed [7:0] kernel20, kernel21, kernel22, kernel23;
    reg signed [7:0] kernel30, kernel31, kernel32, kernel33;
    wire signed [24:0] out_result;

    // Instantiate the module under test
    convModV3 uut (
        .last_result(last_result),
        .data00(data00), .data01(data01), .data02(data02), .data03(data03),
        .data10(data10), .data11(data11), .data12(data12), .data13(data13),
        .data20(data20), .data21(data21), .data22(data22), .data23(data23),
        .data30(data30), .data31(data31), .data32(data32), .data33(data33),
        .kernel00(kernel00), .kernel01(kernel01), .kernel02(kernel02), .kernel03(kernel03),
        .kernel10(kernel10), .kernel11(kernel11), .kernel12(kernel12), .kernel13(kernel13),
        .kernel20(kernel20), .kernel21(kernel21), .kernel22(kernel22), .kernel23(kernel23),
        .kernel30(kernel30), .kernel31(kernel31), .kernel32(kernel32), .kernel33(kernel33),
        .out_result(out_result)
    );

    initial begin
        // Test case 1
        last_result = 25'd0;
        data00 = 8'd1; data01 = 8'd2; data02 = 8'd3; data03 = 8'd4;
        data10 = 8'd5; data11 = 8'd6; data12 = 8'd7; data13 = 8'd8;
        data20 = 8'd9; data21 = 8'd10; data22 = 8'd11; data23 = 8'd12;
        data30 = 8'd13; data31 = 8'd14; data32 = 8'd15; data33 = 8'd16;
        kernel00 = 8'd1; kernel01 = 8'd1; kernel02 = 8'd1; kernel03 = 8'd1;
        kernel10 = 8'd1; kernel11 = 8'd1; kernel12 = 8'd1; kernel13 = 8'd1;
        kernel20 = 8'd1; kernel21 = 8'd1; kernel22 = 8'd1; kernel23 = 8'd1;
        kernel30 = 8'd1; kernel31 = 8'd1; kernel32 = 8'd1; kernel33 = 8'd1;

        #10;
        if (out_result !== 25'd136) begin
            $display("FAIL: Expected out_result = 136, got %d", out_result);
            $finish;
        end

        // Test case 2
        last_result = 25'd10;
        data00 = 8'd1; data01 = 8'd1; data02 = 8'd1; data03 = 8'd1;
        data10 = 8'd1; data11 = 8'd1; data12 = 8'd1; data13 = 8'd1;
        data20 = 8'd1; data21 = 8'd1; data22 = 8'd1; data23 = 8'd1;
        data30 = 8'd1; data31 = 8'd1; data32 = 8'd1; data33 = 8'd1;
        kernel00 = 8'd1; kernel01 = 8'd1; kernel02 = 8'd1; kernel03 = 8'd1;
        kernel10 = 8'd1; kernel11 = 8'd1; kernel12 = 8'd1; kernel13 = 8'd1;
        kernel20 = 8'd1; kernel21 = 8'd1; kernel22 = 8'd1; kernel23 = 8'd1;
        kernel30 = 8'd1; kernel31 = 8'd1; kernel32 = 8'd1; kernel33 = 8'd1;

        #10;
        if (out_result !== 25'd26) begin
            $display("FAIL: Expected out_result = 26, got %d", out_result);
            $finish;
        end

        // Test case 3
        last_result = 25'd5;
        data00 = 8'd2; data01 = 8'd2; data02 = 8'd2; data03 = 8'd2;
        data10 = 8'd2; data11 = 8'd2; data12 = 8'd2; data13 = 8'd2;
        data20 = 8'd2; data21 = 8'd2; data22 = 8'd2; data23 = 8'd2;
        data30 = 8'd2; data31 = 8'd2; data32 = 8'd2; data33 = 8'd2;
        kernel00 = 8'd1; kernel01 = 8'd1; kernel02 = 8'd1; kernel03 = 8'd1;
        kernel10 = 8'd1; kernel11 = 8'd1; kernel12 = 8'd1; kernel13 = 8'd1;
        kernel20 = 8'd1; kernel21 = 8'd1; kernel22 = 8'd1; kernel23 = 8'd1;
        kernel30 = 8'd1; kernel31 = 8'd1; kernel32 = 8'd1; kernel33 = 8'd1;

        #10;
        if (out_result !== 25'd37) begin
            $display("FAIL: Expected out_result = 37, got %d", out_result);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule