`timescale 1ns/1ps

module tb_detect_module;

    // Parameters
    reg CLK;
    reg RSTn;
    reg Rx_Pin_In;
    wire H2L_Sig;

    // Instantiate the module under test (uut)
    detect_module uut (
        .CLK(CLK),
        .RSTn(RSTn),
        .Rx_Pin_In(Rx_Pin_In),
        .H2L_Sig(H2L_Sig)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        RSTn = 0;
        Rx_Pin_In = 1;

        // Apply reset
        #10 RSTn = 1; // Release reset after 10ns

        // Test case 1: No falling edge
        #10;
        if (H2L_Sig !== 0) begin
            $display("FAIL: Expected H2L_Sig = 0, got %b", H2L_Sig);
            $finish;
        end

        // Test case 2: Falling edge detected
        #10 Rx_Pin_In = 0; // Create falling edge
        #10;
        if (H2L_Sig !== 1) begin
            $display("FAIL: Expected H2L_Sig = 1, got %b", H2L_Sig);
            $finish;
        end

        // Test case 3: No falling edge after the pulse
        #10 Rx_Pin_In = 1; // Go back high
        #10;
        if (H2L_Sig !== 0) begin
            $display("FAIL: Expected H2L_Sig = 0, got %b", H2L_Sig);
            $finish;
        end

        // Test case 4: Another falling edge detected
        #10 Rx_Pin_In = 0; // Create another falling edge
        #10;
        if (H2L_Sig !== 1) begin
            $display("FAIL: Expected H2L_Sig = 1, got %b", H2L_Sig);
            $finish;
        end

        // Test case 5: Hold state after falling edge
        #10 Rx_Pin_In = 1; // Go back high
        #10;
        if (H2L_Sig !== 0) begin
            $display("FAIL: Expected H2L_Sig = 0, got %b", H2L_Sig);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule