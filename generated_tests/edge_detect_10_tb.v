`timescale 1ns/1ps

module tb_edge_detect;

    // Testbench signals
    reg clk;
    reg rst_n;
    reg a;
    wire rise;
    wire down;

    // Instantiate the module under test (uut)
    edge_detect uut (
        .clk(clk),
        .rst_n(rst_n),
        .a(a),
        .rise(rise),
        .down(down)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        a = 0;

        // Apply reset
        #10;
        rst_n = 1; // Release reset

        // Test rising edge detection
        #10; a = 1; // Rising edge detected
        #10; if (!rise || down) $display("FAIL: Rising edge not detected correctly");
        
        #10; a = 1; // No edge
        #10; if (rise || down) $display("FAIL: Incorrect edge detection on stable high");

        #10; a = 0; // Falling edge detected
        #10; if (!down || rise) $display("FAIL: Falling edge not detected correctly");

        #10; a = 0; // No edge
        #10; if (rise || down) $display("FAIL: Incorrect edge detection on stable low");

        #10; a = 1; // Rising edge detected again
        #10; if (!rise || down) $display("FAIL: Rising edge not detected correctly");

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule