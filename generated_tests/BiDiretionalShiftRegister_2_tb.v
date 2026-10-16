`timescale 1ns/1ps

module testbench;
    reg Dir;
    reg Data;
    reg clk;
    reg rst_n;
    wire [7:0] Out;

    // Instantiate the BiDirectionalShiftRegister
    BiDiretionalShiftRegister uut (
        .Dir(Dir),
        .Data(Data),
        .clk(clk),
        .rst_n(rst_n),
        .Out(Out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0; // Assert reset
        Dir = 0;   // Default direction (left)
        Data = 0;  // Default data

        // Release reset
        #10 rst_n = 1;

        // Test shifting left
        Dir = 1; Data = 1; #10; // Shift in 1
        if (Out !== 8'b00000001) $display("FAIL: Expected Out = 00000001, got Out = %b", Out);
        
        Dir = 1; Data = 0; #10; // Shift in 0
        if (Out !== 8'b00000010) $display("FAIL: Expected Out = 00000010, got Out = %b", Out);
        
        Dir = 1; Data = 1; #10; // Shift in 1
        if (Out !== 8'b00000101) $display("FAIL: Expected Out = 00000101, got Out = %b", Out);
        
        // Test shifting right
        Dir = 0; Data = 1; #10; // Shift in 1
        if (Out !== 8'b10000101) $display("FAIL: Expected Out = 10000101, got Out = %b", Out);
        
        Dir = 0; Data = 0; #10; // Shift in 0
        if (Out !== 8'b01000101) $display("FAIL: Expected Out = 01000101, got Out = %b", Out);
        
        Dir = 0; Data = 1; #10; // Shift in 1
        if (Out !== 8'b10100101) $display("FAIL: Expected Out = 10100101, got Out = %b", Out);
        
        // Test reset functionality
        rst_n = 0; #10; // Assert reset
        if (Out !== 8'b00000000) $display("FAIL: Expected Out = 00000000 after reset, got Out = %b", Out);
        
        rst_n = 1; // Release reset
        Dir = 1; Data = 1; #10; // Shift in 1
        if (Out !== 8'b00000001) $display("FAIL: Expected Out = 00000001 after reset, got Out = %b", Out);

        // End simulation
        $display("PASS");
        $finish;
    end
endmodule