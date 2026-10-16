`timescale 1ns/1ps

module tb_MUX;

    parameter fix_bit = 7;
    parameter bits = 16;

    reg [(2*bits)-1:0] IN0;
    reg [(2*bits)-1:0] IN1;
    reg [(2*bits)-1:0] IN2;
    reg [(2*bits)-1:0] IN3;
    reg [1:0] SEL;
    wire [(2*bits)-1:0] OUT;

    // Instantiate the MUX module
    MUX #(fix_bit, bits) uut (
        .IN0(IN0),
        .IN1(IN1),
        .IN2(IN2),
        .IN3(IN3),
        .SEL(SEL),
        .OUT(OUT)
    );

    initial begin
        // Initialize inputs
        IN0 = 16'hAAAA; // Example input
        IN1 = 16'h5555; // Example input
        IN2 = 16'hFFFF; // Example input
        IN3 = 16'h0000; // Example input
        SEL = 2'b00;    // Start with selecting IN0

        // Test each selection
        #10;
        if (OUT !== IN0) begin
            $display("FAIL: Expected OUT = %h, got OUT = %h for SEL = %b", IN0, OUT, SEL);
            $finish;
        end

        SEL = 2'b01;    // Select IN1
        #10;
        if (OUT !== IN1) begin
            $display("FAIL: Expected OUT = %h, got OUT = %h for SEL = %b", IN1, OUT, SEL);
            $finish;
        end

        SEL = 2'b10;    // Select IN2
        #10;
        if (OUT !== IN2) begin
            $display("FAIL: Expected OUT = %h, got OUT = %h for SEL = %b", IN2, OUT, SEL);
            $finish;
        end

        SEL = 2'b11;    // Select IN3
        #10;
        if (OUT !== IN3) begin
            $display("FAIL: Expected OUT = %h, got OUT = %h for SEL = %b", IN3, OUT, SEL);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule