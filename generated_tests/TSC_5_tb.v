`timescale 1ns/1ps

module tb_TSC;

    reg rst;
    reg clk;
    reg Tj_Trig;
    reg [127:0] state;
    reg [127:0] rk1, rk2, rk3, rk4, rk5, rk6, rk7, rk8;
    
    wire enable1, enable2, enable3, enable4, enable5, enable6, enable7, enable8;
    wire [7:0] SHReg1, SHReg2, SHReg3, SHReg4, SHReg5, SHReg6, SHReg7, SHReg8;

    TSC uut (
        .rst(rst),
        .clk(clk),
        .Tj_Trig(Tj_Trig),
        .state(state),
        .rk1(rk1),
        .rk2(rk2),
        .rk3(rk3),
        .rk4(rk4),
        .rk5(rk5),
        .rk6(rk6),
        .rk7(rk7),
        .rk8(rk8)
    );

    initial begin
        clk = 0;
        rst = 1;
        Tj_Trig = 0;
        state = 128'h00000000000000000000000000000000;
        rk1 = 128'h00000000000000000000000000000000;
        rk2 = 128'h00000000000000000000000000000000;
        rk3 = 128'h00000000000000000000000000000000;
        rk4 = 128'h00000000000000000000000000000000;
        rk5 = 128'h00000000000000000000000000000000;
        rk6 = 128'h00000000000000000000000000000000;
        rk7 = 128'h00000000000000000000000000000000;
        rk8 = 128'h00000000000000000000000000000000;

        #10 rst = 0; // Release reset
        #10 Tj_Trig = 1; // Trigger enable signals
        state = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; // Set state to all ones
        rk1 = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; // Set rk1 to all ones
        rk2 = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; // Set rk2 to all ones
        rk3 = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; // Set rk3 to all ones
        rk4 = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; // Set rk4 to all ones
        rk5 = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; // Set rk5 to all ones
        rk6 = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; // Set rk6 to all ones
        rk7 = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; // Set rk7 to all ones
        rk8 = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; // Set rk8 to all ones

        #10; // Wait for some clock cycles
        if (SHReg1 != 8'b01010101 || SHReg2 != 8'b01010101 || SHReg3 != 8'b01010101 || 
            SHReg4 != 8'b01010101 || SHReg5 != 8'b01010101 || SHReg6 != 8'b01010101 || 
            SHReg7 != 8'b01010101 || SHReg8 != 8'b01010101) begin
            $display("FAIL: Shift registers did not rotate as expected");
            $finish;
        end

        // Reset and check
        rst = 1;
        #10;
        if (SHReg1 != 8'b10101010 || SHReg2 != 8'b10101010 || SHReg3 != 8'b10101010 || 
            SHReg4 != 8'b10101010 || SHReg5 != 8'b10101010 || SHReg6 != 8'b10101010 || 
            SHReg7 != 8'b10101010 || SHReg8 != 8'b10101010) begin
            $display("FAIL: Shift registers did not reset to expected pattern");
            $finish;
        end

        $display("PASS");
        $finish;
    end

    always #5 clk = ~clk; // Generate clock

endmodule