`timescale 1ns/1ps

module tb_mux_5to1;

    // Testbench signals
    reg clk;
    reg rst;
    reg [4:0] select;
    reg [11:0] voltage_display;
    reg [11:0] current_display;
    reg [11:0] power_display;
    reg [11:0] temperature_display;
    reg [11:0] efficiency_display;
    wire [11:0] mux;

    // Instantiate the module under test (uut)
    mux_5to1 uut (
        .clk(clk),
        .rst(rst),
        .select(select),
        .voltage_display(voltage_display),
        .current_display(current_display),
        .power_display(power_display),
        .temperature_display(temperature_display),
        .efficiency_display(efficiency_display),
        .mux(mux)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        voltage_display = 12'hAAA;
        current_display = 12'hBBB;
        power_display = 12'hCCC;
        temperature_display = 12'hDDD;
        efficiency_display = 12'hEEE;

        // Release reset
        #10 rst = 0;

        // Test case 1: Select voltage_display
        select = 5'b00001; // Select voltage
        #10;
        if (mux !== voltage_display) begin
            $display("FAIL: mux output should be voltage_display");
            $finish;
        end

        // Test case 2: Select current_display
        select = 5'b00010; // Select current
        #10;
        if (mux !== current_display) begin
            $display("FAIL: mux output should be current_display");
            $finish;
        end

        // Test case 3: Select power_display
        select = 5'b00100; // Select power
        #10;
        if (mux !== power_display) begin
            $display("FAIL: mux output should be power_display");
            $finish;
        end

        // Test case 4: Select temperature_display
        select = 5'b01000; // Select temperature
        #10;
        if (mux !== temperature_display) begin
            $display("FAIL: mux output should be temperature_display");
            $finish;
        end

        // Test case 5: Select efficiency_display
        select = 5'b10000; // Select efficiency
        #10;
        if (mux !== efficiency_display) begin
            $display("FAIL: mux output should be efficiency_display");
            $finish;
        end

        // Test case 6: Reset functionality
        rst = 1; // Assert reset
        #10;
        if (mux !== 12'b0) begin
            $display("FAIL: mux output should be 0 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule