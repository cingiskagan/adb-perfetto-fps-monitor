SELECT printf('A: %.2f  D: %.2f', (SELECT (COUNT(*)*1e9)/(MAX(ts)-MIN(ts)) FROM actual_frame_timeline_slice),(SELECT (COUNT(*)*1e9)/(MAX(ts)-MIN(ts)) FROM expected_frame_timeline_slice));
