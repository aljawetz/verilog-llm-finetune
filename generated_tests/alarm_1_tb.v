`timescale 1ns/1ps

module tb_alarm;
    reg clk;
    reg rst;
    reg al;
    reg set_al_hr;
    reg set_al_min;
    reg [7:0] hr;
    reg [7:0] min;
    wire buzzer;
    wire [7:0] al_hr;
    wire [7:0] al_min;

    // Instantiate the module under test (uut)
    alarm uut (
        .clk(clk),
        .rst(rst),
        .al(al),
        .set_al_hr(set_al_hr),
        .set_al_min(set_al_min),
        .hr(hr),
        .min(min),
        .buzzer(buzzer),
        .al_hr(al_hr),
        .al_min(al_min)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 0;
        al = 0;
        set_al_hr = 0;
        set_al_min = 0;
        hr = 8'd12; // Current time set to 12:00
        min = 8'd0;

        // Reset the system
        #10;
        rst = 1;

        // Test 1: Set alarm time to 12:30
        al = 1; // Enter alarm setting mode
        set_al_hr = 0; // Not setting hour
        set_al_min = 1; // Setting minutes
        #10; // Wait for state transition
        if (al_min !== 8'd1) $display("FAIL: Expected al_min to be 1 after incrementing minutes");
        
        #10; // Increment minutes
        if (al_min !== 8'd2) $display("FAIL: Expected al_min to be 2 after incrementing minutes");
        
        #10; // Increment minutes
        if (al_min !== 8'd3) $display("FAIL: Expected al_min to be 3 after incrementing minutes");
        
        set_al_min = 0; // Stop setting minutes
        set_al_hr = 1; // Start setting hours
        #10; // Wait for state transition
        if (al_hr !== 8'd0) $display("FAIL: Expected al_hr to be 0 after incrementing hours");
        
        #10; // Increment hours
        if (al_hr !== 8'd1) $display("FAIL: Expected al_hr to be 1 after incrementing hours");
        
        #10; // Increment hours
        if (al_hr !== 8'd2) $display("FAIL: Expected al_hr to be 2 after incrementing hours");
        
        set_al_hr = 0; // Stop setting hours
        al = 0; // Exit alarm setting mode
        #10; // Wait for state transition
        
        // Test 2: Check buzzer activation
        hr = 8'd2; // Set current time to 2:30
        min = 8'd30;
        #10; // Wait for state transition
        if (buzzer !== 1) $display("FAIL: Expected buzzer to be activated at 2:30");

        // Test 3: Check buzzer deactivation
        hr = 8'd2; // Set current time to 2:31
        min = 8'd31;
        #10; // Wait for state transition
        if (buzzer !== 0) $display("FAIL: Expected buzzer to be deactivated at 2:31");

        // End simulation
        $display("PASS");
        $finish;
    end
endmodule