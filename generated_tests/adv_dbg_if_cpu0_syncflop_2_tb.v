`timescale 1ns/1ps

module tb_adv_dbg_if_cpu0_syncflop;

    reg DEST_CLK;
    reg D_SET;
    reg D_RST;
    reg RESET;
    reg TOGGLE_IN;
    wire D_OUT;

    // Instantiate the module under test (uut)
    adv_dbg_if_cpu0_syncflop uut (
        .DEST_CLK(DEST_CLK),
        .D_SET(D_SET),
        .D_RST(D_RST),
        .RESET(RESET),
        .TOGGLE_IN(TOGGLE_IN),
        .D_OUT(D_OUT)
    );

    // Clock generation
    initial begin
        DEST_CLK = 0;
        forever #5 DEST_CLK = ~DEST_CLK; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        D_SET = 0;
        D_RST = 0;
        RESET = 1; // Start with RESET active
        TOGGLE_IN = 0;

        // Release reset
        #10 RESET = 0;

        // Test case 1: Toggle input without set/reset
        #10 TOGGLE_IN = 1; // Toggle input high
        #10 TOGGLE_IN = 0; // Toggle input low
        #10 if (D_OUT !== 1) begin
            $display("FAIL: D_OUT should be 1 after toggle");
            $finish;
        end

        // Test case 2: Set condition
        #10 D_SET = 1; // Set the output
        #10 if (D_OUT !== 1) begin
            $display("FAIL: D_OUT should be 1 after D_SET");
            $finish;
        end
        D_SET = 0; // Release set

        // Test case 3: Reset condition
        #10 D_RST = 1; // Reset the output
        #10 if (D_OUT !== 0) begin
            $display("FAIL: D_OUT should be 0 after D_RST");
            $finish;
        end
        D_RST = 0; // Release reset

        // Test case 4: Toggle input again
        #10 TOGGLE_IN = 1; // Toggle input high
        #10 TOGGLE_IN = 0; // Toggle input low
        #10 if (D_OUT !== 1) begin
            $display("FAIL: D_OUT should be 1 after second toggle");
            $finish;
        end

        // Test case 5: Reset the entire module
        #10 RESET = 1; // Activate reset
        #10 RESET = 0; // Release reset
        #10 if (D_OUT !== 0) begin
            $display("FAIL: D_OUT should be 0 after reset");
            $finish;
        end

        // Final check: Toggle input after reset
        #10 TOGGLE_IN = 1; // Toggle input high
        #10 TOGGLE_IN = 0; // Toggle input low
        #10 if (D_OUT !== 1) begin
            $display("FAIL: D_OUT should be 1 after toggle post-reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule