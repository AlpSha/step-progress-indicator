# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Package Overview

This is a Flutter UI widget package called `step_progress_indicator` that provides two main customizable progress indicator widgets:
- **StepProgressIndicator** - Linear/horizontal progress indicators made of discrete steps
- **CircularStepProgressIndicator** - Circular progress indicators made of discrete steps

## Core Architecture

### Library Structure
- **Main export**: `lib/step_progress_indicator.dart` (barrel export)
- **Linear indicator**: `lib/src/step_progress_indicator.dart`
- **Circular indicator**: `lib/src/circular_step_progress_indicator.dart`

### Key Design Patterns
- **Function-based customization**: Both widgets use callback functions for dynamic styling (`customColor(index)`, `customSize(index, isSelected)`, etc.)
- **Performance optimizations**: Linear indicator automatically detects when only 2 step types are needed instead of rendering individual steps
- **Custom painters**: Circular indicator uses custom painting for precise arc rendering
- **Responsive design**: Handles unbounded containers with fallback sizing

## Development Commands

```bash
# Standard Flutter package development
flutter pub get          # Install dependencies
flutter analyze          # Static analysis (currently has issues with Flutter 3.32.0)
flutter test            # Run tests (currently failing due to BorderRadiusGeometry API changes)
flutter format .        # Code formatting

# No custom build scripts - uses standard Flutter toolchain
```

## Testing Structure

- `test/step_progress_indicator_test.dart` - Linear indicator tests
- `test/circular_step_progress_indicator_test.dart` - Circular indicator tests

**Current Issue**: Tests fail on Flutter 3.32.0 due to breaking changes in BorderRadiusGeometry API. Tests expect direct access to properties like `topLeft`, `bottomRight` which are no longer available.

## Examples and Development

### Simple Examples (`example/`)
- `main.dart` - Main demo app with navigation
- `horizontal_bar.dart` - Comprehensive horizontal examples
- `vertical_bar.dart` - Vertical indicator examples
- `circular_bar1.dart`, `circular_bar2.dart` - Circular variations
- `circular_animation1.dart` - Animated progress demo

### Full App Example (`example/app_example/`)
Complete Flutter app demonstrating advanced usage patterns including gradients, custom step content, and responsive behavior.

## Key Implementation Details

### StepProgressIndicator
- **Required**: `totalSteps`
- **Core customization**: Direction, colors, sizes, padding, gradients, custom widgets
- **Optimization**: When `padding == 0` and no custom settings, renders as 2-step system instead of individual steps

### CircularStepProgressIndicator  
- **Required**: `totalSteps`, `width`, `height`
- **Circular-specific**: `padding` (radians), `startingAngle`, `arcSize`, `stepSize`, `circularDirection`
- **Advanced**: Rounded caps, center child widget, precise angle control

## Current State

- **Version**: 1.0.2 (stable)
- **Flutter compatibility**: Designed for Flutter 3.8.0+, but has analyzer issues with 3.32.0
- **Null safety**: Fully supported
- **Known issues**: Test suite needs updates for newer Flutter versions