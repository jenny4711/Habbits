# Habbits - iOS Habit Tracking Application

## 프로젝트 개요
**개발 기간**: 2025년 5월 - 현재  
**개발 환경**: iOS 15.0+, Xcode 14.0+, Swift 5.7+  
**아키텍처**: MVVM (Model-View-ViewModel)  
**UI 프레임워크**: SwiftUI  
**데이터 저장**: UserDefaults + Codable  
**알림 시스템**: UserNotifications  

## 프로젝트 설명
개인 습관 형성과 추적을 위한 iOS 네이티브 앱으로, 사용자가 일일 습관을 체크하고 연속 달성 일수를 추적할 수 있는 기능을 제공합니다. 직관적인 UI/UX와 강력한 데이터 관리 기능을 통해 사용자의 목표 달성을 돕습니다.

## 핵심 기능 및 기술적 성과

### 1. 습관 관리 시스템
- **커스터마이징**: 이모지와 색상을 통한 개인화된 습관 표현
- **데이터 모델링**: Codable 프로토콜을 활용한 효율적인 데이터 직렬화/역직렬화
- **로컬 저장소**: UserDefaults를 통한 안전한 데이터 영속성 관리

### 2. 시간 기반 로직 구현
- **4PM 경계 시스템**: 사용자 경험을 고려한 하루 경계 설정 (오후 4시 기준)
- **Calendar Extension**: 복잡한 날짜 계산 로직을 Calendar 확장으로 캡슐화
- **자동 카운트 업데이트**: 시간 경과에 따른 자동적인 일수 계산

### 3. 알림 시스템
- **UNUserNotificationCenter**: iOS 네이티브 알림 시스템 활용
- **권한 관리**: 사용자 알림 권한 요청 및 처리
- **델리게이트 패턴**: 앱 생명주기에 따른 알림 처리

### 4. SwiftUI 기반 UI/UX
- **반응형 디자인**: 다양한 화면 크기 대응
- **다크 모드 지원**: 시스템 테마에 따른 자동 색상 전환
- **시트 프레젠테이션**: 모달 방식의 폼 인터페이스
- **커스텀 컴포넌트**: 재사용 가능한 UI 컴포넌트 설계

### 5. MVVM 아키텍처
- **ViewModel**: 비즈니스 로직과 UI 상태 관리 분리
- **ObservableObject**: SwiftUI와의 반응형 데이터 바인딩
- **EnvironmentObject**: 앱 전체 상태 관리

## 기술적 도전과 해결

### 1. 복잡한 날짜 계산 로직
**문제**: 사용자 경험을 고려한 하루 경계 설정  
**해결**: Calendar Extension을 통한 4PM 기준 경계 시스템 구현
```swift
func last4PMBoundary(for date: Date) -> Date {
    // 복잡한 날짜 계산 로직을 캡슐화
}
```

### 2. 데이터 일관성 보장
**문제**: 앱 재시작 시 데이터 동기화  
**해결**: Codable 프로토콜과 UserDefaults를 활용한 안정적인 데이터 저장

### 3. 실시간 UI 업데이트
**문제**: 데이터 변경 시 UI 자동 반영  
**해결**: @StateObject와 @EnvironmentObject를 활용한 반응형 아키텍처

## 개발 성과 및 학습 내용

### 기술적 성과
- **네이티브 iOS 개발**: SwiftUI를 활용한 모던 iOS 앱 개발 경험
- **아키텍처 설계**: MVVM 패턴을 통한 확장 가능한 코드 구조
- **사용자 경험**: 직관적인 UI/UX 설계 및 구현
- **데이터 관리**: 효율적인 로컬 데이터 저장 및 관리

### 문제 해결 능력
- 복잡한 비즈니스 로직을 간단하고 이해하기 쉬운 코드로 구현
- 사용자 요구사항을 기술적 솔루션으로 변환
- 코드 재사용성과 유지보수성을 고려한 설계

### 협업 및 프로젝트 관리
- Git을 통한 버전 관리 및 코드 리뷰
- 체계적인 프로젝트 구조 설계
- 문서화 및 README 작성

## 사용 기술 스택
- **언어**: Swift 5.7+
- **UI**: SwiftUI, UIKit (알림)
- **아키텍처**: MVVM
- **데이터**: UserDefaults, Codable
- **알림**: UserNotifications
- **의존성 관리**: CocoaPods
- **버전 관리**: Git, GitHub

## 프로젝트 결과
- 완전히 기능하는 iOS 앱 개발 완료
- 사용자 친화적인 인터페이스 구현
- 안정적인 데이터 관리 시스템 구축
- 확장 가능한 아키텍처 설계

---

## Resume용 간단 버전

**Habbits - iOS Habit Tracking App**  
*Swift, SwiftUI, MVVM Architecture*

- SwiftUI를 활용한 네이티브 iOS 앱 개발로 사용자 습관 추적 기능 구현
- MVVM 아키텍처 패턴을 적용하여 확장 가능하고 유지보수 가능한 코드 구조 설계
- UserNotifications를 활용한 푸시 알림 시스템 및 UserDefaults를 통한 로컬 데이터 관리
- 복잡한 날짜 계산 로직을 Calendar Extension으로 캡슐화하여 코드 재사용성 향상
- 다크 모드 지원 및 반응형 UI 설계로 사용자 경험 개선

**기술 스택**: Swift, SwiftUI, UserNotifications, UserDefaults, MVVM, Git
