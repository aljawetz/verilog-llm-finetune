`timescale 1ns/1ps

module tb_top_module;

    reg [2:0] sel;
    reg [3:0] data0, data1, data2, data3, data4, data5;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    top_module uut (
        .sel(sel),
        .data0(data0),
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .data4(data4),
        .data5(data5),
        .out(out)
    );

    initial begin
        // Initialize inputs
        data0 = 4'b0001;
        data1 = 4'b0010;
        data2 = 4'b0011;
        data3 = 4'b0100;
        data4 = 4'b0101;
        data5 = 4'b0110;

        // Test all select lines
        sel = 3'b000; #10;
        if (out !== data0) begin
            $display("FAIL: Expected %b, got %b for sel=%b", data0, out, sel);
            $finish;
        end

        sel = 3'b001; #10;
        if (out !== data1) begin
            $display("FAIL: Expected %b, got %b for sel=%b", data1, out, sel);
            $finish;
        end

        sel = 3'b010; #10;
        if (out !== data2) begin
            $display("FAIL: Expected %b, got %b for sel=%b", data2, out, sel);
            $finish;
        end

        sel = 3'b011; #10;
        if (out !== data3) begin
            $display("FAIL: Expected %b, got %b for sel=%b", data3, out, sel);
            $finish;
        end

        sel = 3'b100; #10;
        if (out !== data4) begin
            $display("FAIL: Expected %b, got %b for sel=%b", data4, out, sel);
            $finish;
        end

        sel = 3'b101; #10;
        if (out !== data5) begin
            $display("FAIL: Expected %b, got %b for sel=%b", data5, out, sel);
            $finish;
        end

        sel = 3'b110; #10; // Test default case
        if (out !== 4'b0000) begin
            $display("FAIL: Expected 0000, got %b for sel=%b", out, sel);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule