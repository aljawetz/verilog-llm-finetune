`timescale 1ns/1ps

module tb_washing_machine_fsm;

    // Inputs
    reg RST;
    reg CLK;
    reg ON_SUMMER;
    reg ON_WINTER;
    reg TIMER_DONE;
    reg DOOR_SENSOR;
    reg WATER_SENSOR_M;
    reg WATER_SENSOR_H;

    // Outputs
    wire [1:0] TIMER_SEL;
    wire TIMER_EN;
    wire WASHER_EN;
    wire WATER_EN;
    wire SPIN_EN;
    wire DRAIN_EN;
    wire FILLING;
    wire ACTIVE;
    wire DRAIN;
    wire SPIN;
    wire IDLE;
    wire DONE;

    // Instantiate the Unit Under Test (UUT)
    washing_machine_fsm uut (
        .RST(RST), 
        .CLK(CLK), 
        .ON_SUMMER(ON_SUMMER), 
        .ON_WINTER(ON_WINTER), 
        .TIMER_DONE(TIMER_DONE), 
        .DOOR_SENSOR(DOOR_SENSOR), 
        .WATER_SENSOR_M(WATER_SENSOR_M), 
        .WATER_SENSOR_H(WATER_SENSOR_H), 
        .TIMER_SEL(TIMER_SEL), 
        .TIMER_EN(TIMER_EN), 
        .WASHER_EN(WASHER_EN), 
        .WATER_EN(WATER_EN), 
        .SPIN_EN(SPIN_EN), 
        .DRAIN_EN(DRAIN_EN), 
        .FILLING(FILLING), 
        .ACTIVE(ACTIVE), 
        .DRAIN(DRAIN), 
        .SPIN(SPIN), 
        .IDLE(IDLE), 
        .DONE(DONE)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        RST = 0;
        ON_SUMMER = 0;
        ON_WINTER = 0;
        TIMER_DONE = 0;
        DOOR_SENSOR = 0;
        WATER_SENSOR_M = 0;
        WATER_SENSOR_H = 0;

        // Apply reset
        #10 RST = 1; // Release reset
        #10;

        // Test 1: Summer mode filling
        ON_SUMMER = 1;
        DOOR_SENSOR = 1;
        #10;
        if (uut.current_state !== uut.fill_med) begin
            $display("FAIL: Expected fill_med state after summer mode activation");
            $finish;
        end

        // Simulate water sensor for medium level
        WATER_SENSOR_M = 1;
        #10;
        if (uut.current_state !== uut.activate) begin
            $display("FAIL: Expected activate state after medium water level");
            $finish;
        end

        // Simulate timer done
        TIMER_DONE = 1;
        #10;
        if (uut.current_state !== uut.drain) begin
            $display("FAIL: Expected drain state after timer done");
            $finish;
        end

        // Simulate draining
        WATER_SENSOR_M = 0;
        WATER_SENSOR_H = 0;
        #10;
        if (uut.current_state !== uut.spin_op) begin
            $display("FAIL: Expected spin_op state after draining");
            $finish;
        end

        // Simulate spinning
        TIMER_DONE = 1;
        #10;
        if (uut.current_state !== uut.end_op) begin
            $display("FAIL: Expected end_op state after spinning");
            $finish;
        end

        // Simulate door open
        DOOR_SENSOR = 0;
        #10;
        if (uut.current_state !== uut.idle_op) begin
            $display("FAIL: Expected idle_op state after door open");
            $finish;
        end

        // Test 2: Winter mode filling
        ON_WINTER = 1;
        ON_SUMMER = 0;
        DOOR_SENSOR = 1;
        #10;
        if (uut.current_state !== uut.fill_high) begin
            $display("FAIL: Expected fill_high state after winter mode activation");
            $finish;
        end

        // Simulate water sensor for high level
        WATER_SENSOR_H = 1;
        #10;
        if (uut.current_state !== uut.activate) begin
            $display("FAIL: Expected activate state after high water level");
            $finish;
        end

        // Complete the cycle
        TIMER_DONE = 1;
        #10;
        if (uut.current_state !== uut.drain) begin
            $display("FAIL: Expected drain state after timer done");
            $finish;
        end

        // Finalize
        $display("PASS");
        $finish;
    end

endmodule